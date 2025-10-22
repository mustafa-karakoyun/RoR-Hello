# app/serializers/comment_serializer.rb
class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at
  
  # Include who wrote the comment and which post it's on
  belongs_to :user
  belongs_to :post
end