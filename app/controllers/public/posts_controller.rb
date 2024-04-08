class Public::PostsController < ApplicationController

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

end
