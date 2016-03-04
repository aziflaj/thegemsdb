require 'sinatra/base'
require './gemstone'

class Website < Sinatra::Base
  configure do
    set :public_folder, 'assets'
    set :views, 'templates'
  end

  # config for development
  configure :development do
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
  end

  # config for deployment in Heroku
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

  not_found do
    @title = "404 | TGDB"
    erb :fourohfour, layout: :layout
  end
end
