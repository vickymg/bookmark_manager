ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/link'
require './lib/tag'
require './lib/dm_setup'

class BookmarkApp < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  post '/new' do

    if params[:URL].include?('http://') || params[:URL].include?('https://')
      @url = params[:URL]
    else
      @url = 'http://' + params[:URL]
    end

    if Link.all(url: @url).empty?
      @link = Link.create(title: params[:Title], url: @url)
    else
      @link = Link.first(url: @url)
    end

    params[:Tags].downcase.split(', ').each do |tag|
      if Tag.all(name: tag).empty?
        @new_tag = Tag.create(name: tag)
        @link.tags << @new_tag
        @link.save
        @new_tag.links << @link
        @new_tag.save
      else
        @old_tag = Tag.first(name: tag)
        @link.tags << @old_tag
        @link.save
        @old_tag.links << @link
        @old_tag.save
      end
    end

    redirect to '/'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :index
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
