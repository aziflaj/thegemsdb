require 'sinatra/base'
require './gemstone'

class Website < Sinatra::Base
  configure do
    set :public_folder, 'assets'
    set :views, 'templates'
  end

  get '/hello/:name' do
    "Hello #{params[:name]}, I'm Frank. Nice to meet you!"
  end

  get '/' do
    erb :index, layout: :layout
  end

  not_found do
    @title = "404 | TGDB"
    erb :fourohfour, layout: :layout
  end
end
