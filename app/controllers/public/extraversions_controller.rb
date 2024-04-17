class Public::ExtraversionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def new
    @extraversion = Extraversion.new
    @extraversions = Extraversion.all
  end

  def create
    @extraversion = Extraversion.new(extraversion_params)
    @extraversion.user = current_user
    if @extraversion.save
      redirect_to new_controllability_path
    else
      @extraversion = Extraversion.new
      render :new
    end
  end

  def update
  end

   private

  def extraversion_params
    params.require(:extraversion).permit(:category_id, :question)
  end

end
