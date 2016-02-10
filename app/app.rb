ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/link'


class Bookmark < Sinatra::Base

  get '/link' do
    @link = Link.all
    erb :index
  end

  get '/link/add-new' do
    erb :add_new
  end

  post '/link' do
    link = Link.create(url: params[:url], bookmark_name: params[:bookmark_name])
    tag = Tag.create(bookmark_name: params[:bookmark_name], tag: params[:tag])
    link.tag << tag
    link.save
    redirect to ('/link')
  end

  # post '/tagging' do

  # end
=begin
  get '/link/add-tag' do
    erb :add_tag
  end
=end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
