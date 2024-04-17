class Public::ExtraversionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    #ExtraversionAnswerのanswerへ保存するためにnewで作成
    @extraversion = ExtraversionAnswer.new
    @extraversions = Extraversion.all
    #answer保存の為の空データを作成、renderで戻ってきたときに入力済のデータを表示する
    @answers = []
  end

  def create
    @extraversion = ExtraversionAnswer.new
    @extraversions = Extraversion.all
    @answers = []
    #eachでextraversion_answerのk(key)とv(value)をemotionality_answer_id毎に処理
    params[:extraversion_answer].each do |k, v|
      #@extraversion = ExtraversionAnswer.newにエラーがあればelseへ飛ぶ
      #elseへ飛ぶバリデーションはif v.to_i == 0 で'v'が0→未回答の時
      @extraversion.errors.add(:base, '') if v.to_i == 0
      #k=(:emotionality_id),v=(:answer)に指定して@answerに追加
      @answers << {
        answer: v.to_i,
        extraversion_id: k.to_i,
        user_id: current_user.id,
        created_at: Time.current,
        updated_at: Time.current
      }
    end
    #@extraversionでエラーが無い(false)時unless以下へ、エラーがある(true)の時elseへ
    unless @extraversion.errors.any?
      #@answerをExtraversionAnswerへ一括保存(insert_all)
      ExtraversionAnswer.insert_all @answers
      redirect_to  new_controllability_path
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end
