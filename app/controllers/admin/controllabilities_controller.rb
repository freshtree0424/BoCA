class Admin::ControllabilitiesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @controllability = Controllability.new
  end

  def index
    if params[:search].present?
      @controllabilities = Controllability.page(params[:page]).per(10)
      @heading = "誠実性"
    end
    @controllabilities = Controllability.page(params[:page]).per(10)
    @heading = "誠実性"
  end

  def create
    @controllability = Controllability.new(controllability_params)
   if @controllability.save
    flash[:notice] = "新規作成しました"
    redirect_to admin_questions_path
   else
    flash[:alert] = "失敗しました"
    render :new
   end
  end

  def update
   @controllability = Controllability.find_by(id: params[:id])
    if @controllability.update(controllability_params)
      flash[:notice] = "変更しました"
      redirect_to admin_questions_path
    else
      flash[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  def edit
    @controllability = Controllability.find_by(id: params[:id])
  end

  def destroy
    controllability = Controllability.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if controllability.nil?
      redirect_to admin_root_path
      return
    end
    controllability.destroy
    redirect_to admin_questions_path
  end

  private

  def controllability_params
    params.require(:controllability).permit(:category_id, :question)
  end

end
