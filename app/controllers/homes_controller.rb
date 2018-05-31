class HomesController < ApplicationController
  def show
  end

  def index
    @tags = Tag.all
    @genres = Genre.all
  end

  def update_tag
  end

  def update_watchlist
  end
end
