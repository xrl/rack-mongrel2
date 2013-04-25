require 'ffi-rzmq'
require 'mongrel2/request'
require 'mongrel2/response'

module Mongrel2
  
  class ConnectionDiedError < StandardError; end
  
  class Connection
    @context = nil

    def self.context
      @context ||= ZMQ::Context.new(1)
    end

    def initialize(options)
      @uuid, @sub, @pub, @graceful_linger = options[:uuid], options[:recv], options[:send], options[:graceful_linger]

      # Connect to receive requests
      @reqs = self.class.context.socket(ZMQ::PULL)
      @reqs.connect(@sub)
      @reqs.setsockopt(ZMQ::LINGER, 0)

      # Connect to send responses
      @resp = self.class.context.socket(ZMQ::PUB)
      @resp.connect(@pub)
      @resp.setsockopt(ZMQ::IDENTITY, @uuid)
      @resp.setsockopt(ZMQ::LINGER, 0)

      @poller = ZMQ::Poller.new
      @poller.register(@reqs)
    end

    def recv
      if @poller.poll(30) > 0
        @poller.readables.each do |socket|
          msg = ''
          socket.recv_string(msg)
          return Request.parse(msg) unless msg.nil?
        end
      end
    end

    def reply(req, body, status = 200, headers = {})
      resp = Response.new(@resp)
      resp.send_http(req, body, status, headers)
      resp.close(req) if req.close?
    end

    def close
      self.class.context.close rescue nil
    end
  end
end
