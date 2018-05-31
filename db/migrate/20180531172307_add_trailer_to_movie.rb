class AddTrailerToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :trailer, :string

  end
end
