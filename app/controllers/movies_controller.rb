class MoviesController < ApplicationController
  def index
    @tags = Tag.all
    @genres = Genre.all

    if params[:clicked_tag].present? || params[:clicked_genre].present?
      filter_movies_by_selected_tags
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    reviews
  end

  def reviews
    @reviews = @movie.reviews
    @users_with_reviews = @reviews.pluck(:user_id)
  end

  private

  def filter_movies_by_selected_tags
    @movies = Movie.includes(:tags, :genres).select do |movie|
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
