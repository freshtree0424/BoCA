class AdminController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about]
end
