
ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/users/sign_up' do
    flash[:error] if flash[:error]
    @email = session[:user_email] if flash[:error]
    erb(:'users/sign_up')
  end

  get '/users/sign_in' do
    erb(:'users/sign_in')
  end

  post '/users/sign_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/links')
    end
    flash[:error] = ["Invalid username or password"]
    redirect('/users/sign_in')
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id

    if user.id.nil?
      session[:user_email] = params[:email]
      flash[:error] = user.errors.full_messages

      redirect '/users/sign_up'
    end

    redirect('/links') #personalised links later
  end

  get '/links' do
    @user = User.first(id: session[:user_id])
  	@links = Link.all
  	erb(:'links/index')
  end

  get '/links/new' do
  	erb(:'links/new')
  end

  post '/links' do
  	link = Link.new(url: params[:url], title: params[:title])
    split_tag(params[:tags]).each do |tag_name|
      tag = Tag.first_or_create(name: tag_name)
      link.tags << tag
    end
    link.save
  	redirect('/links')
  end

  get '/tags/:tag' do
    tag = Tag.first(name: params[:tag])
    @links = tag ? tag.links : []
    erb(:'links/index')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
