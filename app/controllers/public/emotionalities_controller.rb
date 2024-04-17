class Public::EmotionalitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    @emotionality = Emotionality.new
    @emotionalities = Emotionality.all
  end

  def create
    @emotionalities = Emotionality.all
    @emotionalities.each do |emotionality|
      answer = EmotionalityAnswer.new
      answer.emotionality_id = emotionality.id # 必要に応じて質問のIDを保存
      answer.answer = params[:emotionality][:answer] # フォームからの回答を保存
      puts "Emotionality #{emotionality.id}: Emotionality ID #{answer.emotionality_id}"
      if answer.save
        flash[:success] = "Answers saved successfully!"
        redirect_to  new_extraversion_path
      else
        flash[:error] = "Error saving answers."
        render :new
        return
      end
    end
  end

  def update
  end

   private

  def emotionality_params
    params.require(:emotionality).permit(:category_id, :question,:answer)
  end

end
