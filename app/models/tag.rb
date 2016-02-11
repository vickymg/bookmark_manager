require_relative '../data_mapper_setup.rb'

class Tag
  include DataMapper::Resource

  has n, :link, through: Resource

  property :id, Serial
  property :tag, String

end
