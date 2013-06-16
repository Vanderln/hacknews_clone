class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :commentvotes

  def time_passed
    ((Time.now - created_at)/3600).round(2)
  end
  
end

