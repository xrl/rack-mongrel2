require 'zmq'
require 'mongrel2/request'
require 'mongrel2/response'

module Mongrel2
  
  class ConnectionDiedError < StandardError; end
  
  class Connection
    CTX = ZMQ::Context.new(1)

    def initialize(options)
      @uuid, @sub, @pub = options[:uuid], options[:recv], options[:send]

      # Connect to receive requests
      @reqs = CTX.socket(ZMQ::PULL)
      @reqs.connect(@sub)
      @reqs.setsockopt(ZMQ::LINGER, options[:recv_linger] || 0)

      # Connect to send responses
      @resp = CTX.socket(ZMQ::PUB)
      @resp.connect(@pub)
      @resp.setsockopt(ZMQ::IDENTITY, @uuid)
      @resp.setsockopt(ZMQ::LINGER, options[:send_linger] || 0)
    end

    def recv
      msg = nil
      begin
        ready_sockets = ZMQ.select([@reqs], nil, nil, 30)
        if !ready_sockets.nil?
          ready_sockets[0].each do | socket |
            msg = socket.recv(ZMQ::NOBLOCK)
            msg = Request.parse(msg) unless msg.nil?
          end
        end
      rescue RuntimeError => e
        raise ConnectionDiedError
      end
      msg
    end

    def reply(req, body, status = 200, headers = {})
      resp = Response.new(@resp)
      resp.send_http(req, body, status, headers)
      resp.close(req) if req.close?
    end

    def close
      @resp.close
      @reqs.close
      CTX.close
    end
  end
end