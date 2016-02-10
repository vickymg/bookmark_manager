require_relative 'dm_setup'

class Tag
  include DataMapper::Resource

  property :id,    Serial
  property :name,  String
  property :urls,  String

end

dm_setup
