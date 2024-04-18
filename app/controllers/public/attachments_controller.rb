class Public::AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    #AttachmentAnswerのanswerへ保存するためにnewで作成
    @attachment = AttachmentAnswer.new
    @attachments = Attachment.all
    #answer保存の為の空データを作成、renderで戻ってきたときに入力済のデータを表示する
    @answers = []
  end

  def create
    @attachment = AttachmentAnswer.new
    @attachments = Attachment.all
    @answers = []
    #eachでattachment_answerのk(key)とv(value)をattachment_answer_id毎に処理
    params[:attachment_answer].each do |k, v|
      #@attachment = AttachmentAnswer.newにエラーがあればelseへ飛ぶ
      #elseへ飛ぶバリデーションはif v.to_i == 0 で'v'が0→未回答の時
      @attachment.errors.add(:base, '') if v.to_i == 0
      #k=(:attachment_id),v=(:answer)に指定して@answerに追加
      @answers << {
        answer: v.to_i,
        attachment_id: k.to_i,
        user_id: current_user.id,
        created_at: Time.current,
        updated_at: Time.current
      }
    end
    #@attachmentでエラーが無い(false)時unless以下へ、エラーがある(true)の時elseへ
    unless @attachment.errors.any?
      #@answerをAttachmentAnswerへ一括保存(insert_all)
      AttachmentAnswer.insert_all @answers
      redirect_to  new_playability_path
    else
      flash[:alert] = "エラーが発生しました。未回答がないかご確認ください。"
      render :new
    end
  end

  def update
  end

end
