
  class UserMoviesController < ApplicationController
  def create_catalogue
    movie_id = params[:movie][:@movie_id].to_i
    @user_movie = UserMovie.where(user_id: current_user.id, movie_id: movie_id)
    if @user_movie.empty?
      @user_movie = UserMovie.create(user_id: current_user.id, movie_id: movie_id, watched: true)
    else
      @user_movie.update(user_id: current_user.id, movie_id: movie_id, watched: true)
    end
    # raise
    redirect_to dashboard_path
  end

  def create_watch
    movie_id = params[:movie][:movie_id].to_i
    @user_movie = UserMovie.create(user_id: current_user.id, movie_id: movie_id, watched: false)
    # raise
  end

  def update
  end

end
