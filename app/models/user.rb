# Class for an auth'd user
class User < ApplicationRecord
  validates :username, presence: true, format: { with: /\A[\w_]{3,}\z/ }, uniqueness: true
  has_secure_password
end
