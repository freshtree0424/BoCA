class Admin::AnalysesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all.page(params[:page])
  end
end
