class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.page(params[:page]).per(10)
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      @categories = Category.all.page(params[:page]).per(10)
      render :index
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    category = Category.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if category.nil?
      redirect_to admin_root_path
      return
    end
    category.destroy
    redirect_to admin_categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
