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

get '/gems' do
  @gems = Stone.all
  erb :"gems/index"
end

get '/gems/new' do
  @gemstone = Stone.new
  erb :"gems/new"
end

get '/gems/:id' do
  @gemstone = Stone.get(params[:id])
  if @gemstone
    erb :"gems/show"
  else
    not_found
  end
end

post 'gems' do
  # TODO: implement this
  # post -> create new resource
end

get '/gems/:id/edit' do
  # TODO: implement this
end

put '/gems/:id' do
end

delete '/gems/:id' do
end

not_found do
  @title = "404 | TGDB"
  erb :fourohfour, layout: :layout
end
