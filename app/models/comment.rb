class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_rich_text :message

  validates_presence_of :message
end
