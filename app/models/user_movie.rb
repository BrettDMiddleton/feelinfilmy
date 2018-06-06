class UserMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  def self.find_or_create(current_user_id, movie_id)
    user_movie = self.where(user_id: current_user_id, movie_id: movie_id)

    if user_movie.empty?
      user_movie = self.create(user_id: current_user_id, movie_id: movie_id)
    else
      user_movie
    end

  end
end
