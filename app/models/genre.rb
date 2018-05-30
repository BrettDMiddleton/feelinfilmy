class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :genres
end
