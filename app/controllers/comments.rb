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
