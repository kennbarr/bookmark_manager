ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    split_tag(params[:tags]).each do |tag_name|
      tag = Tag.first_or_create(name: tag_name)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @user = User.all
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/signup' do
    erb :'signup'
  end

  post '/signup' do
    user = User.create( username: params[:username], email: params[:email],
                        password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
