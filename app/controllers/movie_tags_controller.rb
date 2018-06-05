class MovieTagsController < ApplicationController

  def create
    @tag_id = params[:movie_tag][:tag_id]
    @movie_tag = MovieTag.new(movie_tag_params)

    if @movie_tag.save
      respond_to do |format|
        format.html
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html
        format.js  # <-- idem
      end
    end
  end


  private

  def movie_tag_params
    params.require(:movie_tag).permit(:movie_id, :user_id, :tag_id)
  end
end
