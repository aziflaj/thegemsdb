require 'dm-core'
require 'dm-migrations'

# config for development
configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

# config for deployment in Heroku
configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

class Gemstone
  include DataMapper::Resource
  property :id, Serial            # Serial = AutoIncrement
  property :name, String
  property :description, Text
end

# Before using the Gemstone class, we make sure to call this method below
# to be able to use the class
DataMapper.finalize
