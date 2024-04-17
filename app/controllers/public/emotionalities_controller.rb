class Public::EmotionalitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    #EmotionalityAnswerのanswerへ保存するためにnewで作成
    @emotionality = EmotionalityAnswer.new
    @emotionalities = Emotionality.all
    #answer保存の為の空データを作成、renderで戻ってきたときに入力済のデータを表示する
    @answers = []
  end

  def create
    @emotionalities = Emotionality.all
    @emotionality = EmotionalityAnswer.new
    @answers = []
    #eachでemotionality_answerのk(key)とv(value)をemotionality_answer_id毎に処理
    params[:emotionality_answer].each do |k, v|
      #@emotionality = EmotionalityAnswer.newにエラーがあればelseへ飛ぶ
      #elseへ飛ぶバリデーションはif v.to_i == 0 で'v'が0→未回答の時
      @emotionality.errors.add(:base, '') if v.to_i == 0
      #k=(:emotionality_id),v=(:answer)に指定して@answerに追加
      @answers << {
        answer: v.to_i,
        emotionality_id: k.to_i,
        user_id: current_user.id,
        created_at: Time.current,
        updated_at: Time.current
      }
    end
    #@emotionalityでエラーが無い(false)時unless以下へ、エラーがある(true)の時elseへ
    unless @emotionality.errors.any?
      #@answerをEmotionalityAnswerへ一括保存(insert_all)
      EmotionalityAnswer.insert_all @answers
      redirect_to  new_extraversion_path
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end
