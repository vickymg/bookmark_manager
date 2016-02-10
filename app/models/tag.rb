require 'data_mapper'
require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :tag, String
  
end
