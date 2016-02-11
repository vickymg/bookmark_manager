require_relative '../data_mapper_setup.rb'
require 'bcrypt'

class User
  include DataMapper::Resource

  has n, :link, through: Resource

  property :id,   Serial
  property :email, String
  property :password_digest, Text
  # property :count, Integrer

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
