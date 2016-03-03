require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Stone
  include DataMapper::Resource
  property :id, Serial            # Serial = AutoIncrement
  property :name, String
  property :description, Text
end

# Before using the Stone class, we make sure to call this method below
# to be able to use the class
DataMapper.finalize
