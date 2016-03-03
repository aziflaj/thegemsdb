require 'sinatra'
require 'sinatra/reloader' if development?

# Configs
set :bind, '0.0.0.0'
set :port, '3000'
set :public_folder, 'assets'
set :views, 'templates'
# end Configs

get '/hello' do
  "Hello Aldo, I'm Frank. Nice to meet you!"
end

get '/' do
  erb :index, layout: :layout
end

get '/gem/:id' do
  gem_id = params[:id]
  "So you want to know more about the gem with id of #{gem_id}"
end

not_found do
  @title = "404 | TGDB"
  erb :fourohfour, layout: :layout
end
