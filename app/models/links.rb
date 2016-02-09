require 'data_mapper'
require 'dm-postgres-adapter'

class links
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, String

#   At the bottom of link.rb, instruct DataMapper to:
# setup a connection to the bookmark_manager_test database
# finalize your DataMapper model
# update your DataMapper models

end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!
