# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'json'
require 'open-uri'

Movie.destroy_all
Tag.destroy_all
User.destroy_all


user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch documentaries.",
  password: "feelinfilmy",
  username: Faker::BackToTheFuture.character,
  last_name: "Ott",
  first_name: "Lauren",
  admin: true,
  avatar: "http://res.cloudinary.com/chimeraggeddon/image/upload/c_scale,h_200,w_200/v1527864307/feelin-filmy/allef-vinicius-152932-unsplash.jpg"

  )
user.save!
user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch romantic films.",
  password: "feelinfilmy",
  username: Faker::HarryPotter.character,
  last_name: "Queen",
  first_name: "Jack",
  avatar: "http://res.cloudinary.com/chimeraggeddon/image/upload/c_scale,h_200,w_200/v1527864480/feelin-filmy/cristian-lozan-371397-unsplash.jpg"

  )
user.save!
user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch fantasy films such as harry potter.",
  password: "feelinfilmy",
  username: Faker::DragonBall.character,
  last_name: "Whitestone",
  first_name: "Jess",
  avatar: "http://res.cloudinary.com/chimeraggeddon/image/upload/c_scale,h_200,w_200/v1527864552/feelin-filmy/eli-defaria-14556-unsplash.jpg"

  )
user.save!
user = User.new(
  email: Faker::Internet.email,
  bio: "I am a big fan of movies that have a lot of action.",
  password: "feelinfilmy",
  username: Faker::DrWho.character,
  last_name: "Witherbee",
  first_name: "Joshua",
  avatar: "https://res.cloudinary.com/chimeraggeddon/image/upload/c_scale,h_200,w_200/v1527864699/feelin-filmy/ethan-hoover-311143-unsplash.jpg"

  )
user.save!

user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch any movie. i just love movies in general.",
  password: "feelinfilmy",
  username: Faker::BreakingBad.character,
  last_name: "Stone",
  first_name: "Ben",
  avatar: "http://res.cloudinary.com/chimeraggeddon/image/upload/c_scale,h_200,w_200/v1527864798/feelin-filmy/mubariz-mehdizadeh-364026-unsplash.jpg"

  )
user.save!

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
  "Star Wars Return of the Jedi",
  "The Green Mile",
  "Event Horizon",
  "Primer",
  "Back to the Future",
  "Blade Runner",
  "Arrival",
  "Prometheus",
  "Mad Max: Fury Road"
]

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

# ----------- TAG SEED ------------

TAGS.each do |tag|
  newtag = Tag.new(name: tag)
  newtag.save!
end

# ----------- MOVIE SEED ------------

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
    # trailer:"https://www.youtube.com/watch?v=#{trailer_path}"
    trailer:trailer_path
    )
  movie.save!
end

# ----------- REVIEW SEED ------------

# Review Seed
# 10.times do
#   review = Review.new(
#     text: Faker::Lorem.paragraph,
#     user_id: User.all.sample,
#     movie_id: Movie.all.sample
#     )
#   review.save!
# end

# ----------- FRIENDSHIPS SEED ------------

# 10.times do
#   users = User.all.sample(2),
#   frendship = Friendship.new(

#     user_id: users[0].id,
#     friend_user_id: users[1].id
#     )
#   frendship.save!
# end


# ----------- MOVIE TAGS SEED ------------

# ----------- USER TAGS ON MOVIES SEED ------------
