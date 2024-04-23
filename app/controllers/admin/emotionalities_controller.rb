class Admin::EmotionalitiesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @emotionality = Emotionality.new
  end

  def create
    @emotionality = Emotionality.new(emotionality_params)
   if @emotionality.save
    flash[:notice] = "新規作成しました"
    redirect_to admin_questions_path
   else
    flash[:alert] = "失敗しました"
    render :new
   end
  end

  def update
  end

  def edit
    @emotionality = Emotionality.find_by(params[:id])
    if @user.nil?
      redirect_to admin_root_path
      return
    end
  end

  private

  def emotionality_params
    params.require(:emotionality).permit(:category_id, :question)
  end

end
