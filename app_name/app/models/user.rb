require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :username, presence: true, uniqueness: true
  has_many :saved_stories
  has_many :comments
  has_many :posts
  has_secure_password
end
