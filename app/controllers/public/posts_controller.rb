class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
   if @post.save
    flash[:notice] = "Book was successfully created."
    redirect_to posts_path(@post.id)
   else
    @user = current_user
    @posts = Post.all
    flash[:Alert] = "error"
    render :index
   end
  end

  def update
    @post = Post.find(params[:id])
    if @post.save
      flash[:notice] = "Book was successfully updated."
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "error"
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Book was successfully destroy."
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :score)
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    user = @post.user
    unless user.id == current_user.id
      flash[:notice] = "権限がありません"
      redirect_to user_path(current_user)
    end
  end

end
