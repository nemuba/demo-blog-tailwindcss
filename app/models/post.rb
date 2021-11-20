# frozen_string_literal: true

# model Post
class Post < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_rich_text :content
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true

  after_create_commit { broadcast_append_to 'posts', self }
  after_update_commit { broadcast_replace_to 'posts', self }
  after_destroy_commit { broadcast_remove_to 'posts', self }

  validates :title, presence: true

  validates_presence_of :content

  pg_search_scope :pg_search, against: :title, using: { tsearch: { prefix: true } },
    associated_against: {
      tags: :name,
      user: :name,
    }
  
  def self.search(query)
    pg_search(query)
  end
end
