# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_31_172307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_user_id"
    t.index ["friend_user_id", "user_id"], name: "index_friendships_on_friend_user_id_and_user_id", unique: true
    t.index ["user_id", "friend_user_id"], name: "index_friendships_on_user_id_and_friend_user_id", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_actors", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_movie_actors_on_actor_id"
    t.index ["movie_id"], name: "index_movie_actors_on_movie_id"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movie_tags", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "user_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_tags_on_movie_id"
    t.index ["tag_id"], name: "index_movie_tags_on_tag_id"
    t.index ["user_id"], name: "index_movie_tags_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.integer "runtime"
    t.string "rating"
    t.text "plot"
    t.string "director"
    t.string "poster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "trailer"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "text"
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_movies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_user_movies_on_movie_id"
    t.index ["user_id"], name: "index_user_movies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "avatar"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "movie_actors", "actors"
  add_foreign_key "movie_actors", "movies"
  add_foreign_key "movie_genres", "genres"
  add_foreign_key "movie_genres", "movies"
  add_foreign_key "movie_tags", "movies"
  add_foreign_key "movie_tags", "tags"
  add_foreign_key "movie_tags", "users"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_movies", "movies"
  add_foreign_key "user_movies", "users"

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

User.destroy_all
Movie.destroy_all
Tag.destroy_all

DBMOVIES = [
  "Forrest Gump",
  "Alien",
  "American Beauty",
  "terminator 2",
  "Let the Right One In",
  "The Hunt",
  "The Place Beyond the Pines",
  "Shawshank Redemption",
  "Moonlight",
  "Eyes Wide Shut",
  "The Dark Knight",
  "star wars",
  "star wars episode vi",
  "Event Horizon",
  "Primer",
  "Back to the Future",
  "Blade Runner",
  "Arrival",
  "Prometheus",
  "Mad Max: Fury Road"
]

DBMOVIES.each do |dbmovie|

  url = "http://www.omdbapi.com/?apikey=6d63447f&t=#{dbmovie}"
  movie_serialized = open(url).read
  moviejson = JSON.parse(movie_serialized)

  url_poster = "https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=#{dbmovie}"
  poster_serialized = open(url_poster).read
  posterjson = JSON.parse(poster_serialized)
  poster_path = posterjson["results"][0]["poster_path"]

  # url_trailer = "https://www.googleapis.com/youtube/v3/search?q=#{dbmovie}+official+trailer+#{moviejson['Year']}&order=date&part=snippet&type=video&maxResults=1&key=AIzaSyBpGfvPwLf49l-SLjxRw0sczKe2XIYniCk"

  url_trailer = "https://www.googleapis.com/youtube/v3/search?q=#{moviejson["Title"]}+official+trailer+#{moviejson['Year']}&order=relevance&part=snippet&maxResults=1&key=AIzaSyBpGfvPwLf49l-SLjxRw0sczKe2XIYniCk"

  trailer_serialized = open(url_trailer).read
  trailerjson = JSON.parse(trailer_serialized)

  trailer_path = trailerjson["items"][0]["id"]["videoId"]

  movie = Movie.new(
    title: moviejson["Title"],
    year: moviejson["Year"],
    runtime: moviejson["Runtime"],
    rating: moviejson["Metascore"],
    plot: moviejson["Plot"],
    director: moviejson["Director"],
    poster:"http://image.tmdb.org/t/p/w500/#{poster_path}",
    trailer:"https://www.youtube.com/watch?v=#{trailer_path}"
    )
  movie.save!
end


TAGS = [
  "character development",
  "acting",
  "dialogue",
  "cinematography",
  "special effects",
  "characters",
  "music and sound design",
  "thought-provoking",
  "awesome villain",
  "storyline/plot",
  "explosions",
  "witty humour"
]

user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch documentaries.",
  password: "feelinfilmy",
  username: Faker::HarryPotter.character,
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name,
  admin: true
  )
# user.remote_avatar_url = "https://res.cloudinary.com/chimeraggeddon/image/upload/v1527699133/feelin-filmy/allef-vinicius-152932-unsplash.jpg"
user.save!
user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch romantic films.",
  password: "feelinfilmy",
  username: Faker::HarryPotter.character,
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name
  )
# user.remote_avatar_url = "https://res.cloudinary.com/chimeraggeddon/image/upload/v1527699133/feelin-filmy/cristian-lozan-371397-unsplash.jpg"
user.save!
user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch fantasy films such as harry potter.",
  password: "feelinfilmy",
  username: Faker::HarryPotter.character,
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name
  )
# user.remote_avatar_url = "https://res.cloudinary.com/chimeraggeddon/image/upload/v1527699134/feelin-filmy/eli-defaria-14556-unsplash.jpg"
user.save!
user = User.new(
  email: Faker::Internet.email,
  bio: "I am a big fan of movies that have a lot of action.",
  password: "feelinfilmy",
  username: Faker::HarryPotter.character,
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name
  )
# user.remote_avatar_url = "https://res.cloudinary.com/chimeraggeddon/image/upload/v1527699133/feelin-filmy/ethan-hoover-311143-unsplash.jpg"
user.save!

user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch any movie. i just love movies in general.",
  password: "feelinfilmy",
  username: Faker::HarryPotter.character,
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name
  )
# user.remote_avatar_url = "https://res.cloudinary.com/chimeraggeddon/image/upload/v1527699134/feelin-filmy/mubariz-mehdizadeh-364026-unsplash.jpg"
user.save!

# 10.times do
#   movie = Movie.new(
#     title: "Star Wars: Episode IV - A New Hope",
#     year: 1978,
#     runtime: 121,
#     rating: "PG-13",
#     plot: "The Imperial Forces, under orders from cruel Darth Vader, hold Princess Leia hostage in their efforts to quell the rebellion against the Galactic Empire. Luke Skywalker and Han Solo, captain of the Millennium Falcon, work together with the companionable droid duo R2-D2 and C-3PO to rescue the beautiful princess, help the Rebel Alliance and restore freedom and justice to the Galaxy.",
#     director: "George Lucas",
#     poster: "https://res.cloudinary.com/chimeraggeddon/image/upload/v1527776092/anewhope.jpg"
#   )
#   movie.save!
# end

# Tag Seed
TAGS.each { |tag| newtag = Tag.new( name: tag ); newtag.save! }

# Review Seed
# 10.times do
#   review = Review.new(
#     text: Faker::Lorem.paragraph,
#     user_id: User.all.sample,
#     movie_id: Movie.all.sample
#     )
#   review.save!
# end
