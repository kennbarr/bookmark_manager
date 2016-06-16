class BookmarkManager < Sinatra::Base
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
end
