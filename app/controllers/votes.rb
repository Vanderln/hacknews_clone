post '/postvote/:post_id' do
	post = Post.find_by_id(params[:post_id])
	vote_value = params[:voteValue].to_i
	pvote = Postvote.find_or_create_by_post_id(:post_id => post.id)

	pvote.votes += vote_value
	pvote.update_attributes(:votes => pvote.votes)
	if !post.postvotes
		post.postvotes << pvote
	end
	"success"
end