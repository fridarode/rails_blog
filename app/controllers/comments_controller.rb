class CommentsController < ApplicationController
  before_action :require_user
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to post_path(params[:comment][:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to users_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
