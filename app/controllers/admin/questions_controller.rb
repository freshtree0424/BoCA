class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @emotionalities = Emotionality.all
    @extraversions = Extraversion.all
    @controllabilities = Controllability.all
    @attachments = Attachment.all
    @playabilities = Playability.all
  end
  
  def select
  end
  
  #def search
  #  case params[:search_model]
  #  when "emotionality" then
  #    redirect_to admin_emotionalities_path(search: params[:search])
  #  when "extraversion" then
  #    redirect_to admin_extraversions_path(search: params[:search])
  #  when "controllability" then
  #    redirect_to admin_controllabilities_path(search: params[:search])
  #  when "attachment" then
  #    redirect_to admin_attachments_path(search: params[:search])
  #    when "playability" then
  #    redirect_to admin_playabilities_path(search: params[:search])
  #  end
  #end
  
end
