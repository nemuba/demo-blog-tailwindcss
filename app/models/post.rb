# frozen_string_literal: true

# model Post
class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true

  validates :title, presence: true

  validates_presence_of :content

  scope :search, ->(title) { includes(:likes, :tags, :comments).where(title: title) }
end
