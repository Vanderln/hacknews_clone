
15.times do
  User.create(:username => Faker::Name.name, :password => "qwerty")
end

100.times do 
  Post.create(:title => Faker::Lorem.sentence, :url => Faker::Internet.url, 
              :user_id => 1+rand(15))
end

200.times do
  Comment.create(:content => Faker::Lorem.sentences(3).join(' '),
                 :user_id => 1+rand(15), :post_id => 1+rand(100))
end

Post.all.each do |post|
	post.postvotes << Postvote.create(:post_id => post.id)
end

Comment.all.each do |comment|
	comment.commentvotes << Commentvote.create(:comment_id => comment.id)
end