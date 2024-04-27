class Admin::AttachmentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @attachment = Attachment.new
  end

  def index
    if params[:search].present?
      @attachments = Attachment.page(params[:page]).per(10)
      @heading = "調和性"
    end
    @attachments = Attachment.page(params[:page]).per(10)
    @heading = "調和性"
  end

  def create
    @attachment = Attachment.new(attachment_params)
   if @attachment.save
    flash[:notice] = "新規作成しました"
    redirect_to admin_questions_path
   else
    flash[:alert] = "失敗しました"
    render :new
   end
  end

  def update
   @attachment = Attachment.find_by(id: params[:id])
    if @attachment.update(attachment_params)
      flash[:notice] = "変更しました"
      redirect_to admin_questions_path
    else
      flash[:alert] = "エラーが発生しました"
      render :edit
    end
  end

  def edit
    @attachment = Attachment.find_by(id: params[:id])
  end

  def destroy
    attachment = Attachment.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if attachment.nil?
      redirect_to admin_root_path
      return
    end
    attachment.destroy
    redirect_to admin_questions_path
  end

  private

  def attachment_params
    params.require(:attachment).permit(:category_id, :question)
  end

end
