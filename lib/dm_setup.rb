require 'data_mapper'
require 'dm-postgres-adapter'

def dm_setup

  DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

  DataMapper::Logger.new($stdout, :debug)

  DataMapper.finalize
  DataMapper.auto_upgrade!

end
