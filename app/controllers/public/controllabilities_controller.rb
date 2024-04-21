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
    user_id = current_user.id
    @controllability = ControllabilityAnswer.new
    @controllabilities = Controllability.all
    @answers = []
    #eachでcontrollability_answerのk(key)とv(value)をcontrollability_answer_id毎に処理
    params[:controllability_answer].each do |k, v|
      #if v.to_i == 0 で'v'が0→未回答の時エラー追加
      @controllability.errors.add(:base, '') if v.to_i == 0
      #点数の逆転項目指定
      ControllabilityAnswer.find_by(user_id: user_id, controllability_id: 1)&.reverse_answer(1)
      ControllabilityAnswer.find_by(user_id: user_id, controllability_id: 3)&.reverse_answer(3)
      ControllabilityAnswer.find_by(user_id: user_id, controllability_id: 5)&.reverse_answer(5)
      ControllabilityAnswer.find_by(user_id: user_id, controllability_id: 6)&.reverse_answer(6)
      ControllabilityAnswer.find_by(user_id: user_id, controllability_id: 8)&.reverse_answer(8)
      #find_or_initialize_byでcontrollabilityidとuser_idでControllabilityAnswerのレコードを検索(find)
      #存在しない(新規)は新規作成、存在する場合は既存のデータを呼び出し
      answer = ControllabilityAnswer.find_or_initialize_by(controllability_id: k.to_i, user_id: current_user.id)
      # answerの属性を入力した内容に更新する
      answer.update(answer: v.to_i)
      #answerの情報を@answerに格納
      @answers << answer
    end
    #エラーが無い(false)時unless以下へ、エラーがある(true)時elseへ
    unless @controllability.errors.any?
      ControllabilityAnswer.transaction do
        @answers.each(&:save!)
      end
      redirect_to  new_attachment_path
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end