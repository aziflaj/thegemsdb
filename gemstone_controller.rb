require 'sinatra/base'
require './gemstone'

class GemstoneController < Sinatra::Base
  configure do
    enable :method_override # to enable _method=PUT and _method=DELETE
    set :public_folder, 'assets'
    set :views, 'templates'
  end

  get '/' do
    @gems = Gemstone.all
    erb :"gemstones/index"
  end

  get '/new' do
    @gemstone = Gemstone.new
    erb :"gemstones/new", layout: :layout
  end

  get '/:id' do
    @gemstone = Gemstone.get(params[:id])
    if @gemstone
      erb :"gemstones/show", layout: :layout
    else
      not_found
    end
  end

  post '/' do
    @gemstone = Gemstone.create(params[:gemstone])
    redirect to("/")
  end

  get '/:id/edit' do
    @gemstone = Gemstone.get(params[:id])
    erb :"gemstones/edit", layout: :layout
  end

  put '/:id' do
    gemstone = Gemstone.get(params[:id])
    gemstone.update(params[:gemstone])
    redirect to("/#{gemstone.id}")
  end

  delete '/:id' do
    Gemstone.get(params[:id]).destroy
    redirect to("/")
  end
end
