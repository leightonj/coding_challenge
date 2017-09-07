# Class for an auth'd user
class User < ApplicationRecord
  validates :username, presence: true, format: { with: /\A[\w\-.@]+\z/i }, uniqueness: true
  has_secure_password
end
