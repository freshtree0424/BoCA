class Admin::ExtraversionsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @extraversion = Extraversion.new
  end

  def index
    if params[:search].present?
      @extraversions = Extraversion.page(params[:page]).per(10)
      @heading = "外向性"
    end
    @extraversions = Extraversion.page(params[:page]).per(10)
    @heading = "外向性"
  end

  def create
    @extraversion = Extraversion.new(extraversion_params)
   if @extraversion.save
    flash[:notice] = "新規作成しました"
    redirect_to admin_questions_path
   else
    flash[:alert] = "失敗しました"
    render :new
   end
  end

  def update
   @extraversion = Extraversion.find_by(id: params[:id])
    if @extraversion.update(extraversion_params)
      flash[:notice] = "変更しました"
      redirect_to admin_questions_path
    else
      flash[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  def edit
    @extraversion = Extraversion.find_by(id: params[:id])
  end

  def destroy
    extraversion = Extraversion.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if extraversion.nil?
      redirect_to admin_root_path
      return
    end
    extraversion.destroy
    redirect_to admin_questions_path
  end

  private

  def extraversion_params
    params.require(:extraversion).permit(:category_id, :question)
  end

end
