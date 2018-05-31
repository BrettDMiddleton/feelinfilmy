class PagesController < ApplicationController
  def landing
  end

  #------------Dashboard Methods-------------#
  def dashboard
    search;
    my_profile;
  end

  def search
    if params[:query].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end

  def my_profile
    @user = current_user
  end

  def user_tags

  end
end

