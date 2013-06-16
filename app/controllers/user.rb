get "/login" do
  erb :login
end

get "/user/:user_id" do
  @posts = Post.find_all_by_user_id(params[:user_id])
  erb :user_post
end

get '/user/posts/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  erb :comment
end

get '/user/:user_id/comments' do
  erb :user_comments

end

get '/user/user_profile/:user_id' do
  erb :user_profile
end

get '/create_user' do
  erb :create_user
  
end

post '/login' do
  p params.inspect
  user = User.authenticate(params[:post][:username], params[:post][:password])

  if user
    session[:user_id] = user.id
    redirect "/user/#{current_user.id}"
  else
    erb :login
  end
end

post '/create_user' do
  user = User.new(params[:post])
  if user.save
    session[:user_id] = user.id
    redirect "/user/#{current_user.id}"
  else
    erb :create_user
  end
end
