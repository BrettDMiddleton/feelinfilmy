class Movie < ApplicationRecord
  has_many :reviews
  has_many :users, through: :user_movies
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :genres
  has_many :movie_genres, through: :genres
  has_many :tags
  has_many :movie_tags, through: :tags
end
