class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_many :commented_posts, :class_name => "Post", :through => :comments

  include BCrypt

  validates_presence_of :username, :message => "You need a password. Don't you understand boundaries?"
  validates_uniqueness_of :username, :message => "You're already signed up."
  
  validates_presence_of :password, :message => "You need a password. Don't you understand boundaries?"

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == password
      user
    else
      false
    end
  end 
end
