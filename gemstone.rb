require 'dm-core'
require 'dm-migrations'

class Gemstone
  include DataMapper::Resource
  property :id, Serial            # Serial = AutoIncrement
  property :name, String
  property :description, Text
end

# Before using the Gemstone class, we make sure to call this method below
# to be able to use the class
DataMapper.finalize
