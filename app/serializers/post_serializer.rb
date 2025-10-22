# app/serializers/post_serializer.rb
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at
  
  # Include the post's author (user) and comments
  belongs_to :user
  has_many :comments
end