class MoviesController < ApplicationController
  def index
    @movie_tag = MovieTag.new
    @tags = Tag.all
    @genres = Genre.all
    my_movies
    filter_movies
  end


  def show
    @tags = Tag.all
    @movie = Movie.find(params[:id])
    @movie_tag = MovieTag.new
    reviews

    respond_to do |format|
      format.html
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

    def reviews
      @reviews = @movie.reviews
      @users_with_reviews = @reviews.pluck(:user_id)
    end


    def filter_movies
      if params[:clicked_tag].present?
        filter_movies_by_selected_tags
      end
    end

    private
    def filter_movies_by_selected_tags
      selected_tag_ids = params[:clicked_tag].keys

    # Not the most efficient way of doing things
    @my_movies = @my_movies.select do |movie|
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
