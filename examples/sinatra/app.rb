require 'sinatra'
require 'loggerator'

include Loggerator

set :port, '3000'
set :bind, '0.0.0.0' # bind for docker
set :logging, false  # disable default logging

use ::Loggerator::Middleware::RequestID
use ::Loggerator::Middleware::RequestStore

# Set Loggerator default_context
self.default_context = { app: :basic }

get '/' do
  context method: :get do
    log status: 200 do
      "Hello Loggerator!\n"
    end
  end
end
