class MoviesController < ApplicationController
  def index
    @tags = Tag.all
    movies = Movie.all
    @movies = movies[12..17]
  end

  def show
  end
end
