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
  erb :"gems/new", layout: :layout
end

get '/gems/:id' do
  @gemstone = Stone.get(params[:id])
  if @gemstone
    erb :"gems/show", layout: :layout
  else
    not_found
  end
end

post '/gems' do
  @gemstone = Stone.create(params[:gemstone])
  redirect to("/gems")
end

get '/gems/:id/edit' do
  @gemstone = Stone.get(params[:id])
  erb :"gems/edit", layout: :layout
end

put '/gems/:id' do
  gemstone = Stone.get(params[:id])
  gemstone.update(params[:gemstone])
  redirect to("/gems/#{gemstone.id}")
end

delete '/gems/:id' do
  Stone.get(params[:id]).destroy
  redirect to("/gems")
end

not_found do
  @title = "404 | TGDB"
  erb :fourohfour, layout: :layout
end
