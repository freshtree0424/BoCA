class Admin::UsersController < ApplicationController
  
  def index
   if params[:search].present?
      @users = User.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
      @heading = "「#{params[:search]}」の検索結果"
    else
      @users = User.all
      @heading = "会員一覧"
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end
  
end
