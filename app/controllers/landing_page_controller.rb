class LandingPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def create
  end
end