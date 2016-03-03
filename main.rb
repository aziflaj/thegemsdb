require 'sinatra'
require './stone'
require 'sinatra/reloader' if development?

# Configs
set :bind, '0.0.0.0'
set :port, '3000'
set :public_folder, 'assets'
set :views, 'templates'
# end Configs

get '/hello' do
  @name = "Aldo"
  "Hello #{@name}, I'm Frank. Nice to meet you!"
end

get '/' do
  erb :index, layout: :layout
end

get '/gem' do
  @gems = Stone.all
  erb :gem
end

get '/gem/:id' do
  gem_id = params[:id]
  @gemstone = Stone.get(gem_id)
  erb :single_gem
end

get 'gem/new' do
  erb :new, layout: :layout
end

post 'gem/store' do
  # TODO: implement this
end

get '/gem/:id/edit' do
  # TODO: implement this
end

not_found do
  @title = "404 | TGDB"
  erb :fourohfour, layout: :layout
end
