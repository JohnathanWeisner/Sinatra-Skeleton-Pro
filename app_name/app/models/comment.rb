class Comment < ActiveRecord::Base
  has_many :comments
  belongs_to :post
  belongs_to :comment
end
