class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
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
    movie_availability

    respond_to do |format|
      format.html
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def movie_availability
    require "open-uri"
    require "nokogiri"

    url = "https://www.finder.com/amazon-prime-movies"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    movie_title = @movie.title
    @availability = false

    html_doc.search('tr>td:first-child').each do |element|
      if movie_title == element.text.strip
        @availability = true
        break
      end
    end
  end

  private

  def reviews
    @reviews = @movie.reviews
    @users_with_reviews = @reviews.pluck(:user_id)
  end

  def filter_movies
    if params[:clicked_tag].present? || params[:clicked_genre].present?
      filter_movies_by_selected_tags
    end
  end

  def filter_movies_by_selected_tags
    @my_movies = @my_movies.includes(:tags, :genres).select do |movie|
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
