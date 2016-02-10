ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/link'
require './lib/tag'

class BookmarkApp < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  post '/new' do

    @tags = params[:Tags].downcase

    #create new tags if neccessary
    @tags.split(', ').each do |tag|
      if Tag.all(name: tag).empty?
        Tag.create(name: tag, urls: params[:URL])
      else
        @link = Tag.first(name: tag).urls
        Tag.first(name: tag).update(urls: (@link + ', ' + params[:URL]))
      end
    end

    #create new links if neccessary
    if Link.all(url: params[:URL]).empty?
      Link.create(title: params[:Title], url: params[:URL], tags: @tags)
    end






    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
