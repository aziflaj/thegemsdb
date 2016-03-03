require 'sinatra'
require 'sinatra/reloader' if development?

# Configs
set :bind, '0.0.0.0'
set :port, '3000'

get '/hello' do
  "Hello Aldo, I'm Frank. Nice to meet you!"
end

get '/' do
  "Check the /hello route"
end
