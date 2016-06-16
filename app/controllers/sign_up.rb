class BookmarkManager < Sinatra::Base
  get '/users/sign_up' do
    flash[:error] if flash[:error]
    @email = session[:user_email] if flash[:error]
    erb(:'users/sign_up')
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
end
