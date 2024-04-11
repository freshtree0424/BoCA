class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:search].present?
      @posts = Post.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?
      @heading = "「#{params[:search]}」の検索結果"
    else
      @posts = Post.all.order(created_at: :asc)
      @heading = "投稿一覧"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
