class HomesController < ApplicationController
  def show
    @tags = Tag.all
  end

  def index
  end

  def update_tag
  end

  def update_watchlist
  end
end
