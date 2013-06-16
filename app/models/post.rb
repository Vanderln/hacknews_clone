class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :postvotes

  def time_passed
    ((Time.now - self.created_at)/3600).round(2)
  end

  
end
