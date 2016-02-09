require 'sinatra/base'
require './lib/link'

class BookmarkApp < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  post '/new' do
    Link.create(title: params[:Title], url: params[:URL])
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
