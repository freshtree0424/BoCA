class Public::AnalysesController < ApplicationController
  def top
  end

  def show
    @user = User.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if @user.nil?
      redirect_to root_path
      return
    end
    #answerの合計点とそれに基づく条件分岐文言
    @emotionality_total_score, @emotionality_grade = EmotionalityAnswer.total_score_and_grade_for_user(@user)
    @extraversion_total_score, @extraversion_grade = ExtraversionAnswer.total_score_and_grade_for_user(@user)
    @controllability_total_score, @controllability_grade = ControllabilityAnswer.total_score_and_grade_for_user(@user)
    @attachment_total_score, @attachment_grade = AttachmentAnswer.total_score_and_grade_for_user(@user)
    @playability_total_score, @playability_grade = PlayabilityAnswer.total_score_and_grade_for_user(@user)
  end

  def detail
    @user = User.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if @user.nil?
      redirect_to root_path
      return
    end
  end


end
