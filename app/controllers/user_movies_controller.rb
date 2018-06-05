  class UserMoviesController < ApplicationController
  def create_catalog
    movie_id = params[:movie][:movie_id].to_i
    @user_movie = UserMovie.create(user_id: current_user.id, movie_id: movie_id, watched: true)
    # raise
  end

  def create_watch
    movie_id = params[:movie][:movie_id].to_i
    @user_movie = UserMovie.create(user_id: current_user.id, movie_id: movie_id, watched: false)
    # raise
  end

  def update
  end

end
