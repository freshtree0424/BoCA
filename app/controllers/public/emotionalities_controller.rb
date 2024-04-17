class Public::EmotionalitiesController < ApplicationController

  def new
    @emotionality = Emotionality.new
    @emotionalities = Emotionality.all
  end

  def create
    @emotionality = Emotionality.new(emotionality_params)
    @emotionality.user = current_user
    if @emotionality.save
      redirect_to root_path
    else
      @emotionality = Emotionality.new
      render :new
    end
  end

  def update
  end

   private

  def emotionality_params
    params.require(:emotionality).permit(:category_id, :question)
  end

end
