class PagesController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  skip_before_action :authenticate_user!

  def landing
    @movie = Movie.all
    @user = User.all
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  #------------Dashboard Methods-------------#
  def dashboard
    search
    my_profile
    @movie_tag = MovieTag.new
    @user_movies = UserMovie.all
  end
  def catalogue
    respond_to do |format|
      format.html
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end

  end
  def watchlist
    respond_to do |format|
      format.html
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end

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

  def friends_dashboard
  end


end

