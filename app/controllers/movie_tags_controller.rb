class MovieTagsController < ApplicationController

  def create
    binding.pry

    params[:tag_ids].each do |tag_id|
      @movie_tag = MovieTag.new(movie_tag_params)
      @movie_tag.user_id = current_user.id
      @movie_tag.tag_id = tag_id
      @movie_tag.save
    end

    respond_to do |format|
        format.html
        format.js  # <-- will render `app/views/reviews/create.js.erb`
    end

  end


  private

  def movie_tag_params
    params.require(:movie_tag).permit(:movie_id)
  end
end
