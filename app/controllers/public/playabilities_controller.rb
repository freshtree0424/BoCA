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
    user_id = current_user.id
    @playability = PlayabilityAnswer.new
    @playabilities = Playability.all
    @answers = []
    #eachでplayability_answerのk(key)とv(value)をplayability_answer_id毎に処理
    params[:playability_answer].each do |k, v|
      #if v.to_i == 0 で'v'が0→未回答の時エラー追加
      @playability.errors.add(:base, '') if v.to_i == 0
      #点数の逆転項目指定
      PlayabilityAnswer.find_by(user_id: user_id, playability_id: 4)&.reverse_answer(4)
      PlayabilityAnswer.find_by(user_id: user_id, playability_id: 5)&.reverse_answer(5)
      #find_or_initialize_byでplayability_idとuser_idでPlayabilityAnswerのレコードを検索(find)
      #存在しない(新規)は新規作成、存在する場合は既存のデータを呼び出し
      answer = PlayabilityAnswer.find_or_initialize_by(playability_id: k.to_i, user_id: current_user.id)
      # answerの属性を入力した内容に更新する
      answer.update(answer: v.to_i)
      #answerの情報を@answerに格納
      @answers << answer
    end
    #エラーが無い(false)時unless以下へ、エラーがある(true)時elseへ
    unless @playability.errors.any?
      PlayabilityAnswer.transaction do
        @answers.each(&:save!)
      end
      redirect_to analysis_path(current_user.id)
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end
