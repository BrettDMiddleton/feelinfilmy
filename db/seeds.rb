# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'json'
require 'open-uri'

MovieGenre.destroy_all
Movie.destroy_all
Tag.destroy_all
User.destroy_all
MovieTag.destroy_all
Review.destroy_all
Genre.destroy_all


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
  "Star Wars",
  "The Green Mile",
  "Event Horizon",
  "Primer",
  "Back to the Future",
  "Blade Runner",
  "Arrival",
  "Prometheus",
  "Mad Max: Fury Road",
  "1984",
  "A Clockwork Orange",
  "Dark City",
  "Elysium",
  "Escape from New York",
  "Gattaca",
  "Hobo with a Shotgun",
  "Idiocracy",
  "In Time",
  "The Island",
  "The Lobster",
  "The Maze Runner",
  "Moon",
  "Outland",
  "The Postman",
  "Repo Man",
  "A Scanner Darkly",
  "Tank Girl",
  "V for Vendetta"
]

# TAGS = [
#   "Hot Moms",
#   "Acting",
#   "Dialogue",
#   "Smart Lead",
#   "Special Effects",
#   "Characters",
#   "Not All White",
#   "Has Swords",
#   "Cool Villain",
#   "Storyline",
#   "Explosions",
#   "Witty Humour"
# ]

# ----------- TAG SEED ------------

# TAGS.each do |tag|
#   newtag = Tag.new(name: tag)
#   newtag.save!
# end

# ----------- MOVIE SEED ------------

genre_array = []
movie_genre_hash = {}


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
  
  movie_id = posterjson["results"].first["id"]

  trailer_path = trailerjson["items"][0]["id"]["videoId"]
  similar_movies = JSON.parse(open("https://api.themoviedb.org/3/movie/#{movie_id}/similar?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb").read) 
  similar_movies["results"].first(3).each do |result|
    p "movie -- #{result["original_title"]}"
    movie = Movie.find_or_create_by!(
      title: result["original_title"],
      year: Date.parse(result["release_date"]).year,
      # runtime: result["Runtime"],
      rating: result["vote_average"].to_s,
      plot: result["overview"],
      # director: result[""],
      poster: "http://image.tmdb.org/t/p/w500/#{result["poster_path"]}",
      # trailer:"https://www.youtube.com/watch?v=#{trailer_path}"
      # trailer: trailer_path
    )
    
    movie_id = result["id"]

    keywords_json = JSON.parse(open("https://api.themoviedb.org/3/movie/#{movie_id}/keywords?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb").read)

    keywords_json["keywords"].each do |keyword|
      p "tag -- " + keyword["name"]
      tag = Tag.find_or_create_by(name: keyword["name"])
      MovieTag.create!(movie: movie, tag: tag, user: User.all.sample)
      # movie.movie_tags.create(tag: tag)
    end
  end

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


  keywords_json = JSON.parse(open("https://api.themoviedb.org/3/movie/#{movie_id}/keywords?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb").read)

  keywords_json["keywords"].each do |keyword|
    p keyword["name"]
    tag = Tag.find_or_create_by(name: keyword["name"])
    MovieTag.create!(movie: movie, tag: tag, user: User.all.sample)
    # movie.movie_tags.create(tag: tag)
  end


  genre_movie = moviejson["Genre"].split(",")
  genre_movie.each do |genre_alone|
    genre_alone.strip!
    genre_array << genre_alone
    movie_genre_hash[moviejson["Title"]] = genre_movie

  end
end

genre_array = genre_array.uniq

genre_array.each do |genre|
 genre_movie = Genre.new(
  name: genre
  )
 genre_movie.save!
end

movie_genre_hash.each do |key, values|
  newmovie = Movie.all.select { |m| m.title == key }
  values.each do |value|
    newgenre = Genre.all.select { |m| m.name == value }
    genre_movie = MovieGenre.new(
      movie_id: newmovie[0].id,
      genre_id: newgenre[0].id
      )
    genre_movie.save!
  end
end

# User.all.each do |user|
#   Movie.all.each do |movie|
#     MovieTag.create(user: user, movie: movie, tag: Tag.all.sample)
#   end
# end

# ----------- USERS MOVIES SEED ------------

@movies = Movie.all
unique_movies = @movies.sample(10)


unique_movies.each do |movie|
random_boolean = [true, false].sample

  user_movie = UserMovie.new(
    user_id: User.first.id,
    movie_id: movie.id,
    watched: random_boolean

    )
  user_movie.save!
end

# ----------- MOVIE TAGS SEED ------------

# @tags = Tag.all
# unique_user_movies = User.first.movies.sample(3)

# unique_user_movies.each do |movie|
#   unique_movie_tags = @tags.sample(3)
#   unique_movie_tags.each do |tag|
#     movie_tag = MovieTag.new(
#       movie_id: movie.id,
#       user_id: User.first.id,
#       tag_id: tag.id
#       )
#     movie_tag.save!
#   end
# end

# ----------- REVIEW SEED ------------

unique_user_movies.each do |movie|
  review = Review.new(
    text: Faker::Lorem.paragraph,
    user_id: User.first.id,
    movie_id: movie.id
    )
  review.save!
end

# ----------- FRIENDSHIPS SEED ------------

unique_users_who_are_not_the_first_user = User.where.not(id: User.first.id).sample(3)

unique_users_who_are_not_the_first_user.each do |user|
  friendship = Friendship.new(
    user_id: User.first.id,
    friend_user_id: user.id
    )
  friendship.save!
end

unique_users_who_are_not_the_second_user = User.where.not(id: User.second.id).sample(3)

unique_users_who_are_not_the_first_user.each do |user|
  friendship = Friendship.new(
    user_id: User.second.id,
    friend_user_id: user.id
    )
  friendship.save!
end

