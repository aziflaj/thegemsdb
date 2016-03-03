require 'sinatra'
require './gemstone'
require 'sinatra/reloader' if development?

# Configs
configure do
  set :bind, '0.0.0.0'
  set :port, '3000'
  set :public_folder, 'assets'
  set :views, 'templates'
end

# This configuration is valid only in development
# In a production environment, we need to set another config for DataMapper
configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

# config for Heroku
configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

get '/hello' do
  @name = "Aldo"
  "Hello #{@name}, I'm Frank. Nice to meet you!"
end

get '/' do
  erb :index, layout: :layout
end

get '/gemstones' do
  @gems = Gemstone.all
  erb :"gemstones/index"
end

get '/gemstones/new' do
  @gemstone = Gemstone.new
  erb :"gemstones/new", layout: :layout
end

get '/gemstones/:id' do
  @gemstone = Gemstone.get(params[:id])
  if @gemstone
    erb :"gemstones/show", layout: :layout
  else
    not_found
  end
end

post '/gemstones' do
  @gemstone = Gemstone.create(params[:gemstone])
  redirect to("/gemstones")
end

get '/gemstones/:id/edit' do
  @gemstone = Gemstone.get(params[:id])
  erb :"gemstones/edit", layout: :layout
end

put '/gemstones/:id' do
  gemstone = Gemstone.get(params[:id])
  gemstone.update(params[:gemstone])
  redirect to("/gemstones/#{gemstone.id}")
end

delete '/gemstones/:id' do
  Gemstone.get(params[:id]).destroy
  redirect to("/gemstones")
end

not_found do
  @title = "404 | TGDB"
  erb :fourohfour, layout: :layout
end
