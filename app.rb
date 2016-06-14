ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/bubbles' do
    @links = []
    Link.each do |x|
      x.tags.each do |tag|
        @links << x if tag.name == "bubbles"
      end
    end
    erb :'links/index'
  end

  run! if app_file == $PROGRAM_NAME
end
