  class UserMoviesController < ApplicationController
  def create
    movie_id = params[:movie][:movie_id].to_i
    @user_movie = UserMovie.create(user_id: current_user.id, movie_id: movie_id)
    raise
  end

  def update
  end

end
