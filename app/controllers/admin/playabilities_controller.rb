class Admin::PlayabilitiesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @playability = Playability.new
  end

  def index
    if params[:search].present?
      @playabilities = Playability.page(params[:page]).per(10)
      @heading = "開放性"
    end
    @playabilities = Playability.page(params[:page]).per(10)
    @heading = "開放性"
  end

  def create
    @playability = Playability.new(playability_params)
   if @playability.save
    flash[:notice] = "新規作成しました"
    redirect_to admin_questions_path
   else
    flash[:alert] = "失敗しました"
    render :new
   end
  end

  def update
   @playability = Playability.find_by(id: params[:id])
    if @playability.update(playability_params)
      flash[:notice] = "変更しました"
      redirect_to admin_questions_path
    else
      flash[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  def edit
    @playability = Playability.find_by(id: params[:id])
  end

  def destroy
    playability = Playability.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if playability.nil?
      redirect_to admin_root_path
      return
    end
    playability.destroy
    redirect_to admin_questions_path
  end

  private

  def playability_params
    params.require(:playability).permit(:category_id, :question)
  end

end
