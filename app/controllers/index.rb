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
  @user.password = params[:password]
  @user.save
  session[:user_id] = @user.id

  redirect to('/profile')
end

get '/post' do
  @post = Post.find(params[:post_id])
  @comments = @post.comments

  erb :comments
end

get '/create_post' do
  if session[:user_id]
    erb :create_post
  else
    redirect to('/')
  end
end

post '/comment' do
  puts params
  if session[:user_id]
    User.find(session[:user_id]).comments << Comment.create(content: params[:content],
                                                            post_id: params[:post_id])
    redirect to("/post?post_id=#{params[:post_id]}")
  else
    erb "<h1>must be logged in to comment</h1>"
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
