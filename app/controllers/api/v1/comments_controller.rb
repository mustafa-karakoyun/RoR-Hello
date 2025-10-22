# app/controllers/api/v1/comments_controller.rb
class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /api/v1/comments
  def index
    @comments = Comment.all
    render json: @comments, each_serializer: CommentSerializer
  end

  # GET /api/v1/comments/1
  def show
    render json: @comment, serializer: CommentSerializer
  end

  # POST /api/v1/comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, serializer: CommentSerializer, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment, serializer: CommentSerializer
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/comments/1
  def destroy
    @comment.destroy
    head :no_content
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end