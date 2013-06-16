
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

500.times do
	Postvote.create(:post_id => 1 + rand(100), :user_id => 1 + rand(15), :votes => [-1,1].sample)
end

500.times do
	Commentvote.create(:comment_id => 1 + rand(200), :user_id => 1 + rand(15), :votes => [-1,1].sample)
end
