require 'sinatra'
require 'json'

get '*' do
  request.env.to_json
end