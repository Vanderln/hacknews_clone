get '/' do
  @all_posts = Post.order("title")

   erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

