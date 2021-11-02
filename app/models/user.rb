# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_secure_password
  has_many :posts
  
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }
end
