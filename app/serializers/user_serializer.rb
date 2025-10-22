# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  
  # Include the user's posts and comments
  has_many :posts
  has_many :comments
end