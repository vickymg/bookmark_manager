ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/link'


class Bookmark < Sinatra::Base

  register Sinatra::Flash

  use Rack::Session::Pool, :expire_after => 36000000

  get '/link' do
    @link = Link.all
    erb :index
  end

  get '/link/add-new' do
    erb :add_new
  end

  post '/link' do
    link = Link.create(url: params[:url], bookmark_name: params[:bookmark_name])
    params[:tag].split.each do |tag|
      link.tag << Tag.create(tag: tag)
    end
    link.save
    redirect to ('/link')
  end


  get '/link/tag/:tag' do
    tag = Tag.first(tag: params[:tag])
    @link = tag ? tag.link : []
    erb :index
  end

  get '/sign-up' do
    @user = User.new
    erb :home
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/link')
    else
      flash.now[:error] = @user.errors.full_messages.join(",")
      erb :home
    end
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
