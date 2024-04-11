class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

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
    @user = @post.user
    @post_comment = PostComment.new
    @post_detail = Post.find(params[:id])
    unless ViewCount.find_by(user_id: current_user.id, post_id: @post_detail.id)
      current_user.view_counts.create(post_id: @post_detail.id)
    end
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
   if @post.save
    redirect_to posts_path(@post.id)
   else
    @user = current_user
    @posts = Post.all
    render :new
   end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    @user = current_user
    redirect_to user_path(@user)
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :score)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    user = @post.user
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
