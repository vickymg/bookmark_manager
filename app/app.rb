ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/link'


class Bookmark < Sinatra::Base

  register Sinatra::Flash


    # def is_user?
    #   current_user != nil
    # end
  #
  # register do
  #   def auth (type)
  #     condition do
  #       redirect "/users/sign_in" unless send("is_#{type}?")
  #     end
  #   end
  # end

  # get '/' do
  #   redirect to('/users/sign_in')
  # end

  get '/link' do
    @link = Link.all
    erb :index
  end

  get '/links/new' do
    erb :'links/new'
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
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/link')
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      erb :'users/new'
    end
  end

  # get '/users/sign_in' do
  #   erb :'users/sign_in'
  # end
  #
  # post '/users/sign_in' do
  #   @user = User.find_by_email(params[:email])
  #   if @user.password = params[:password]
  #     session[:user_id] = @user.id
  #     redirect to('/link')
  #   else
  #     flash.now[:error] = @user.errors.full_messages.join(", ")
  #     erb :'users/sign_in'
  #   end
  # end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
