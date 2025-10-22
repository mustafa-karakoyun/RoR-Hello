# config/routes.rb
Rails.application.routes.draw do
  
  # API version 1
  namespace :api do
    namespace :v1 do
      resources :users
      resources :posts
      resources :comments
    end
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
end