class PublicController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
end
