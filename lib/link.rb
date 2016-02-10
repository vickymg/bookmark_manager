require_relative 'dm_setup'

class Link
  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
  property :tags,   String

end

dm_setup
