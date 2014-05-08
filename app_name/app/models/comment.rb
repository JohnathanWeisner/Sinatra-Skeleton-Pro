class Comment < ActiveRecord::Base
  has_many :comments
  belongs_to :comment
  belongs_to :user
end
