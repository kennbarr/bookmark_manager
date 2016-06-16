class BookmarkManager < Sinatra::Base
  get '/tags/:tag' do
    tag = Tag.first(name: params[:tag])
    @links = tag ? tag.links : []
    erb(:'links/index')
  end
end
