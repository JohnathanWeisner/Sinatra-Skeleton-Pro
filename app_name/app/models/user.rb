require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :username, presence: true, uniqueness: true
  has_many :comments
  has_secure_password
end
