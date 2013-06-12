get "/login" do
  erb :login
end

get "/user/:user_id" do
  @posts = Post.find_all_by_user_id(params[:user_id])
  erb :user_post
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
