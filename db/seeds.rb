# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
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

TAGS.each do |tag|
  newtag = Tag.new(name: tag)
  newtag.save!
end


# Review Seed
# 10.times do
#   review = Review.new(
#     text: Faker::Lorem.paragraph,
#     user_id: User.all.sample,
#     movie_id: Movie.all.sample
#     )
#   review.save!
# end
