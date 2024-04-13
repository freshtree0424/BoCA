class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

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
    @tag_lists = {}
    @posts.each do |post|
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
    end
    # byebug
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
