class Public::PlayabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    @playability = Playability.new
    @playabilities = Playability.all
  end

  def create
    @playability = Playability.new(playability_params)
    @playability.user = current_user
    if @playability.save
      redirect_to analysis_path(user)
    else
      @playability = Playability.new
      render :new
    end
  end

  def update
  end

   private

  def playability_params
    params.require(:playability).permit(:category_id, :question)
  end

end
