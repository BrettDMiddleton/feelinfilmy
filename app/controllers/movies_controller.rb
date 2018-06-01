class MoviesController < ApplicationController
  def index

    @tags = Tag.all

    @movies = Movie.all
  end

  def show
@movie = Movie.find(params[:id])
  end
end
