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
    user_id = current_user.id
    @emotionalities = Emotionality.all
    @emotionality = EmotionalityAnswer.new
    @answers = []
    #eachでemotionality_answerのk(key)とv(value)をemotionality_answer_id毎に処理
    params[:emotionality_answer].each do |k, v|
      #if v.to_i == 0 で'v'が0→未回答の時エラー追加
      @emotionality.errors.add(:base, '') if v.to_i == 0
      #点数の逆転項目指定
      EmotionalityAnswer.find_by(user_id: user_id, emotionality_id: 1)&.reverse_answer(1)
      EmotionalityAnswer.find_by(user_id: user_id, emotionality_id: 3)&.reverse_answer(3)
      #find_or_initialize_byでemotionality_idとuser_idでEmotionalityAnswerのレコードを検索(find)
      #存在しない(新規)は新規作成、存在する場合は既存のデータを呼び出し
      answer = EmotionalityAnswer.find_or_initialize_by(emotionality_id: k.to_i, user_id: current_user.id)
      # answerの属性を入力した内容に更新する
      answer.update(answer: v.to_i)
      #answerの情報を@answerに格納
      @answers << answer
    end
    #エラーが無い(false)時unless以下へ、エラーがある(true)時elseへ
    unless @emotionality.errors.any?
      # 一括保存
      EmotionalityAnswer.transaction do
        @answers.each(&:save!)
      end
      redirect_to  new_extraversion_path
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end