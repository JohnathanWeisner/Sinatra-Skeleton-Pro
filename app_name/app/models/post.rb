class Post < ActiveRecord::Base
  belongs_to :user
  has_many :saved_stories
  has_many :comments
end
