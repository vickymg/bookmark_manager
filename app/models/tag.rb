require_relative 'data_mapper_setup.rb'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :tag, String

end
