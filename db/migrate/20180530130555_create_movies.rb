class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :runtime
      t.string :rating
      t.text :plot
      t.string :director
      t.string :poster

      t.timestamps
    end
  end
end
