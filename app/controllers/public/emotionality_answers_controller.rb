class Public::EmotionalityAnswersController < ApplicationController

  def create
    @emotionality_answer = EmotionalityAnswer.new
    @emotionalities = Emotionality.all
    @emotionalities.each do |emotionality|
      answer.emotionality_id = emotionality.id
      answer.answer = params[:emotionality][:answer]
      if answer.save
        flash[:notice] = "Answers saved successfully!"
      else
        flash[:error] = "Error saving answers."
        render :new
        return
      end
    end
    redirect_to new_extraversion_path
  end

  private

  def emotionality_answer_params
    params.require(:emotionality_answer).permit(:user_id, :emotionality_id, :answer)
  end

end
