class Public::AnalysesController < ApplicationController
  before_action :authenticate_user!
  
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
    #カテゴリー(項目)別合計点
    #神経症傾向
    @emotionality1_answers = @user.category1_answers_sum
    @emotionality2_answers = @user.category2_answers_sum
    @emotionality3_answers = @user.category3_answers_sum
    @emotionality4_answers = @user.category4_answers_sum
    @emotionality5_answers = @user.category5_answers_sum
    #外向性
    @extraversion1_answers = @user.category6_answers_sum
    @extraversion2_answers = @user.category7_answers_sum
    @extraversion3_answers = @user.category8_answers_sum
    @extraversion4_answers = @user.category9_answers_sum
    @extraversion5_answers = @user.category10_answers_sum
    #誠実性
    @controllability1_answers = @user.category11_answers_sum
    @controllability2_answers = @user.category12_answers_sum
    @controllability3_answers = @user.category13_answers_sum
    @controllability4_answers = @user.category14_answers_sum
    @controllability5_answers = @user.category15_answers_sum
    #調和性
    @attachment1_answers = @user.category16_answers_sum
    @attachment2_answers = @user.category17_answers_sum
    @attachment3_answers = @user.category18_answers_sum
    @attachment4_answers = @user.category19_answers_sum
    @attachment5_answers = @user.category20_answers_sum
    #開放性
    @playability1_answers = @user.category21_answers_sum
    @playability2_answers = @user.category22_answers_sum
    @playability3_answers = @user.category23_answers_sum
    @playability4_answers = @user.category24_answers_sum
    @playability5_answers = @user.category25_answers_sum
  end

end
