class Tag < ApplicationRecord
  has_many :movies, through: :movie_tags

end
