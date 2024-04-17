class Public::AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    @attachment = Attachment.new
    @attachments = Attachment.all
  end

  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.user = current_user
    if @attachment.save
      redirect_to new_playability_path
    else
      @attachment = Attachment.new
      render :new
    end
  end

  def update
  end

   private

  def attachment_params
    params.require(:attachment).permit(:category_id, :question)
  end

end
