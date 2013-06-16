post '/postvote/:post_id' do
	post = Post.find_by_id(params[:post_id])
	vote_value = params[:voteValue].to_i
	pvote = Postvote.where(:post_id => post.id, :user_id => current_user.id)
  if pvote.length > 0 
	 "false"
	else  
    pvote = Postvote.create(:post_id => post.id, :user_id => current_user.id)
    pvote.votes += vote_value
    pvote.update_attributes(:votes => pvote.votes)
		"true"
	end
end

post '/commentvote/:comment_id' do
  comment = Comment.find_by_id(params[:comment_id])
  vote_value = params[:voteValue].to_i
  cvote = Commentvote.where(:comment_id => comment.id, :user_id => current_user.id)
  if cvote.length > 0 
   "false"
  else  
    cvote = Commentvote.create(:comment_id => comment.id, :user_id => current_user.id)
    cvote.votes += vote_value
    cvote.update_attributes(:votes => cvote.votes)
    "true"
  end
end

