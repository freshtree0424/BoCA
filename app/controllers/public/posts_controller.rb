class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
  end

  def show
  end

  def edit
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
  end

  def destroy
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :score)
  end

end
