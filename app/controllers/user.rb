get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect to('/')
end

get '/profile' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :user
  else
    redirect to('/login')
  end
end

post '/user' do
  @user = User.find_or_create_by(user_name: params[:user_name])
  if @user.valid?
    @user.password = params[:password]
    @user.save
    session[:user_id] = @user.id
  else
    @message = @user.errors.full_messages
    erb :login
  end

  redirect to('/profile')
end
