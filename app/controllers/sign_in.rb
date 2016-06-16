class BookmarkManager < Sinatra::Base
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

  get '/users/forgot_password' do
    erb :'users/forgot_password'
  end

  post '/users/forgot_password' do
    user = User.first(email: params[:email])
    session[:user_id] = user.id
    redirect '/users/password_reset'
  end

  get '/users/password_reset' do


    erb :'users/password_reset'
  end
end
