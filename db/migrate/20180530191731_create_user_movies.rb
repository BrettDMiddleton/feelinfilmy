class CreateUserMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_movies do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.timestamps
    end
  end
end
