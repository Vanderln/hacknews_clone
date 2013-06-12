get '/create_post' do

  erb :create_post 
end

get '/new' do
  @all_posts = Post.order(:created_at)
  erb :newest_posts
end

get '/user/posts/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  erb :comment
end

get '/user/:user_id/comments' do
  erb :user_comments

end

get '/user/:user_id/user_profile' do
  erb :user_profile
end

post '/create_comment' do
  # p current_user.id.inspect
  @post = Post.find_by_id(params[:post][:post_id])
  @comment = Comment.create(:content => params[:post][:content], 
                            :post_id => params[:post][:post_id], :user_id => current_user.id)
  redirect to "/user/posts/#{@post.id}"
end

post '/create_post' do 
  @post = Post.create(:title => params[:post][:title],
                      :url => params[:post][:url],
                      :user_id => current_user.id)
  redirect to "/user/posts/#{@post.id}"
end
