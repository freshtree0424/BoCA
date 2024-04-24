class Admin::EmotionalitiesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @emotionality = Emotionality.new
  end

  def index
    if params[:search].present?
      @emotionalities = Emotionality.page(params[:page]).per(10)
      @heading = "神経症傾向"
    end
    @emotionalities = Emotionality.page(params[:page]).per(10)
    @heading = "神経症傾向"
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
   @emotionality = Emotionality.find_by(id: params[:id])
    if @emotionality.update(emotionality_params)
      flash[:notice] = "変更しました"
      redirect_to admin_questions_path
    else
      flash[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  def edit
    @emotionality = Emotionality.find_by(id: params[:id])
  end

  def destroy
    emotionality = Emotionality.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if emotionality.nil?
      redirect_to admin_root_path
      return
    end
    emotionality.destroy
    redirect_to admin_questions_path
  end

  private

  def emotionality_params
    params.require(:emotionality).permit(:category_id, :question)
  end

end
