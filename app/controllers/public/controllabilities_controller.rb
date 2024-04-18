class Public::ControllabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    #ControllabilityAnswerのanswerへ保存するためにnewで作成
    @controllability = ControllabilityAnswer.new
    @controllabilities = Controllability.all
    #answer保存の為の空データを作成、renderで戻ってきたときに入力済のデータを表示する
    @answers = []
  end

  def create
    @controllability = ControllabilityAnswer.new
    @controllabilities = Controllability.all
    @answers = []
    #eachでcontrollability_answerのk(key)とv(value)をcontrollability_answer_id毎に処理
    params[:controllability_answer].each do |k, v|
      #@controllability = ControllabilityAnswer.newにエラーがあればelseへ飛ぶ
      #elseへ飛ぶバリデーションはif v.to_i == 0 で'v'が0→未回答の時
      @controllability.errors.add(:base, '') if v.to_i == 0
      #k=(:controllability_id),v=(:answer)に指定して@answerに追加
      @answers << {
        answer: v.to_i,
        controllability_id: k.to_i,
        user_id: current_user.id,
        created_at: Time.current,
        updated_at: Time.current
      }
    end
    #@controllabilityでエラーが無い(false)時unless以下へ、エラーがある(true)の時elseへ
    unless @controllability.errors.any?
      #@answerをControllabilityAnswerへ一括保存(insert_all)
      ControllabilityAnswer.insert_all @answers
      redirect_to  new_attachment_path
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end
