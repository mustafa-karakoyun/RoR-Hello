# app/controllers/api/v1/posts_controller.rb
class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /api/v1/posts
  def index
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer
  end

  # GET /api/v1/posts/1
  def show
    render json: @post, serializer: PostSerializer
  end

  # POST /api/v1/posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, serializer: PostSerializer, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/posts/1
  def update
    if @post.update(post_params)
      render json: @post, serializer: PostSerializer
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/1
  def destroy
    @post.destroy
    head :no_content
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      # Requires a 'post' object, permitting 'title', 'content', and 'user_id'
      params.require(:post).permit(:title, :content, :user_id)
    end
end