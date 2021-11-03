# frozen_string_literal: true

# model Post
class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
end
