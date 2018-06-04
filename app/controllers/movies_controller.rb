class MoviesController < ApplicationController
  def index
    @tags = Tag.all
    @genres = Genre.all

    watched_movies = UserMovie.where(user_id: current_user)

    @movies = Movie.where.not(id: watched_movies.pluck(:movie_id))

  if params[:clicked_tag].present?
    filter_movies_by_selected_tags
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def filter_movies_by_selected_tags
    selected_tag_ids = params[:clicked_tag].keys

    # Not the most efficient way of doing things
    @movies = @movies.select do |movie|
      movies_tags = movie.tags.pluck(:id)
      movies_genres = movie.genres.pluck(:id)
      clicked_tag_ids = params[:clicked_tag]&.keys&.map(&:to_i)
      clicked_genre_ids = params[:clicked_genre]&.keys&.map(&:to_i)

      if clicked_tag_ids && clicked_genre_ids
        clicked_tag_ids.all? { |tag_id| movies_tags.include?(tag_id) } &&
        clicked_genre_ids.all? { |genre_id| movies_genres.include?(genre_id) }
      elsif clicked_genre_ids.present?
       clicked_genre_ids.all? { |genre_id| movies_genres.include?(genre_id) }
      else
        clicked_tag_ids.all? { |tag_id| movies_tags.include?(tag_id) }
      end
    end
  end
end
