class MovieTagsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @tag = Tag.find(params[:tag_id])

    user_movie = UserMovie.find_or_create(current_user.id, @movie.id)
    user_movie.update(watched: true)

    MovieTag.create!(
      user: current_user,
      movie: @movie,
      tag: @tag
    )
  end
end
