class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment,:user_id, :post_id)
  end

end