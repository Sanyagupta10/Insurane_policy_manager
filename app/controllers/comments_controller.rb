# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :current_user, only: %i[create index destroy]

  def index
    if logged_in?
      @usr = current_user
      @p_id = params[:id]
      @comments = Comment.where(policy_id: @p_id)
      @comments = nil if @comments.empty?
    else
      redirect_to login_path
    end
  end

  def new
    if logged_in?
      @pol_id = params[:id]
      @comment = Comment.new
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path(id: @comment.policy_id)
      flash[:success] = 'Comment Successfully Created'
    else
      render 'new'
    end
  end

  def destroy
    @p_id = params[:pid]
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path(id: @p_id)
    flash[:success] = 'Comment Successfully Deleted'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :policy_id)
  end
end
