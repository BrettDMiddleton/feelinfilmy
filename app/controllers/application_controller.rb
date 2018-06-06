class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def my_movies
    watched_movies = UserMovie.where(user_id: current_user)
    @my_movies = Movie.where.not(id: watched_movies.pluck(:movie_id))
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

end
