class AddWatchedToUserMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :user_movies, :watched, :boolean
  end
end
