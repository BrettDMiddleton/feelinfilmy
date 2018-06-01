class MoviesController < ApplicationController
  def index

    @tags = Tag.all
    movies = Movie.all

    if params[:clicked_tag].present?
      filter_movies_by_selected_tags
    else
      @movies = Movie.all
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def show
@movie = Movie.find(params[:id])
  end

  private

  def filter_movies_by_selected_tags
    selected_tag_ids = params[:clicked_tag].keys

    # Not the most efficient way of doing things
    @movies = Movie.all.select do |movie|
      movies_tags = movie.tags.pluck(:id)
      selected_tag_ids.all? { |tag_id| movies_tags.include?(tag_id.to_i) }
    end
  end
end
