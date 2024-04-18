class Public::PlayabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    #PlayabilityAnswerのanswerへ保存するためにnewで作成
    @playability = PlayabilityAnswer.new
    @playabilities = Playability.all
    #answer保存の為の空データを作成、renderで戻ってきたときに入力済のデータを表示する
    @answers = []
  end

  def create
    @playability = PlayabilityAnswer.new
    @playabilities = Playability.all
    @answers = []
    #eachでplayability_answerのk(key)とv(value)をplayability_answer_id毎に処理
    params[:playability_answer].each do |k, v|
      #@playability = PlayabilityAnswer.newにエラーがあればelseへ飛ぶ
      #elseへ飛ぶバリデーションはif v.to_i == 0 で'v'が0→未回答の時
      @playability.errors.add(:base, '') if v.to_i == 0
      #k=(:playability_id),v=(:answer)に指定して@answerに追加
      @answers << {
        answer: v.to_i,
        playability_id: k.to_i,
        user_id: current_user.id,
        created_at: Time.current,
        updated_at: Time.current
      }
    end
    #@playabilityでエラーが無い(false)時unless以下へ、エラーがある(true)の時elseへ
    unless @playability.errors.any?
      #@answerをPlayabilityAnswerへ一括保存(insert_all)
      PlayabilityAnswer.insert_all @answers
      redirect_to analysis_path(current_user.id)
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end
