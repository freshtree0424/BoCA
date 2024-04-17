class Public::ControllabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    @controllability = Controllability.new
    @controllabilities = Controllability.all
  end

  def create
    @controllability = Controllability.new(controllability_params)
    @controllability.user = current_user
    if @controllability.save
      redirect_to new_attachment_path
    else
      @controllability = Controllability.new
      render :new
    end
  end

  def update
  end

   private

  def controllability_params
    params.require(:controllability).permit(:category_id, :question)
  end

end
