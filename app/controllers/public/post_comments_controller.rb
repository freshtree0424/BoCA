class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]

  def create
    post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = post.id
    @comment.save
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment,:user_id, :post_id)
  end

  def ensure_correct_user
    @comment = PostComment.find(params[:id])
    user = @comment.user
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end