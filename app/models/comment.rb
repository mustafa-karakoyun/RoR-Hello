# app/models/comment.rb
class Comment < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :post

  # Validations
  validates :body, presence: true
end