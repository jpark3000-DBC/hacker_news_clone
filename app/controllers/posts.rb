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

post '/add_post_vote' do
  puts params
  Post.increment_counter(:votes, params[:id].to_i)
  Post.find(params[:id]).votes.to_s
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
