class Public::ExtraversionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    #ExtraversionAnswerのanswerへ保存するためにnewで作成
    @extraversion = ExtraversionAnswer.new
    @extraversions = Extraversion.all.sample(10)
    #answer保存の為の空データを作成、renderで戻ってきたときに入力済のデータを表示する
    @answers = []
  end

  def create
    @extraversion = ExtraversionAnswer.new
    @extraversions = Extraversion.all
    @answers = []
    #eachでextraversion_answerのk(key)とv(value)をextraversion_answer_id毎に処理
    params[:extraversion_answer].each do |k, v|
      #if v.to_i == 0 で'v'が0→未回答の時エラー追加
      @extraversion.errors.add(:base, '') if v.to_i == 0
      #find_or_initialize_byでextraversion_idとuser_idでExtraversionAnswerのレコードを検索(find)
      #存在しない(新規)は新規作成、存在する場合は既存のデータを呼び出し
      answer = ExtraversionAnswer.find_or_initialize_by(extraversion_id: k.to_i, user_id: current_user.id)
      #逆転させたい設問番号の時だけ、６から回答を引く　三項演算子
      answer_num = ["1", "10"].include?(k) ? 6 - v.to_i : v.to_i
      # answerの属性を入力した内容に更新する
      answer.update(answer: answer_num)
      #answerの情報を@answerに格納
      @answers << answer
    end
    #エラーが無い(false)時unless以下へ、エラーがある(true)時elseへ
    unless @extraversion.errors.any?
      ExtraversionAnswer.transaction do
        @answers.each(&:save!)
      end
      redirect_to  new_controllability_path
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end
