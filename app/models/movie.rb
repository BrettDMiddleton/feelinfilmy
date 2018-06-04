class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :user_movies, dependent: :destroy
  has_many :users, through: :user_movies
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  # has_many :movie_genres, through: :genres
  # has_many :tags
  # has_many :movie_tags, through: :tags

  has_many :movie_tags, dependent: :destroy
  has_many :tags, through: :movie_tags
end
