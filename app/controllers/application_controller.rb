class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def my_movies
    watched_movies = UserMovie.where(user_id: current_user)
    @my_movies = Movie.where.not(id: watched_movies.pluck(:movie_id))
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
end
