require 'sinatra/base'
require_relative 'models/link'

class Bookmark < Sinatra::Base

  get '/link' do
    @link = Link.all

    erb :'link/index'
  end



  get '/links/add-new' do

    erb :'link/add-new'
  end

  post '/link' do
    Link.create(url: params[:url], title: params[:title])
    redirect to ('/link')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
