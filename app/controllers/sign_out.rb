class BookmarkManager < Sinatra::Base
  delete '/users/sign_out' do
    session[:user_id] = nil
    flash[:error] = ["Goodbye!"]
    redirect('/link')
  end

  get '/link' do
    erb(:'links/link')
  end
end
