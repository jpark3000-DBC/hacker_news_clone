get '/' do
  @posts = Post.all
  # Look in app/views/index.erb
  erb :index
end

get '/login' do

  erb :login
end

get '/logout' do
  session.clear
  redirect to('/')
end

post '/user' do
  user = User.find_or_create_by(user_name: params[:user_name])
  user.password = params[:password]
  user.save
  session[:user_id] = user.id
  erb :user
end

get '/create_post' do
  if session[:user_id]
    erb :create_post
  else
    redirect to('/')
  end
end


post '/create_post' do
  if session[:user_id]
    user = User.find(session[:user_id])
    user.posts << Post.create(title: params[:title],
                              url: params[:url])

    redirect to('/')
  else
    redirect to('/')
  end

end
