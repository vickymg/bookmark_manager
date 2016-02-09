require 'sinatra/base'

class BookmarkApp < Sinatra::Base
  get '/' do
    'http://www.makersacademy.com/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
