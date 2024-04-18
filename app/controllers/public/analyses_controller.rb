class Public::AnalysesController < ApplicationController
  def top
  end

  def show
    @user = current_user
  end

  private


end
