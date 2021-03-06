# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'json'
require 'open-uri'

MovieGenre.destroy_all
puts "destroyed MovieGenre"
Movie.destroy_all
puts "destroyed Movie"
Tag.destroy_all
puts "destroyed Tag"
User.destroy_all
puts "destroyed User"
MovieTag.destroy_all
puts "destroyed MovieTag"
Review.destroy_all
puts "destroyed Review"
Genre.destroy_all
puts "destroyed Genre"


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
brett = User.new(
  email: Faker::Internet.email,
  bio: "I am a big fan of movies that have a lot of action.",
  password: "feelinfilmy",
  username: "MooseisLoose77",
  last_name: "Middleton",
  first_name: "Brett",
  avatar: "https://res.cloudinary.com/chimeraggeddon/image/upload/c_scale,h_200,w_200/v1528484914/brett.png"

  )
brett.save!

ben = User.new(
  email: "ben@mail.com",
  bio: "I love to watch any movie. i just love movies in general.",
  password: "feelinfilmy",
  username: "ben-eh",
  last_name: "Calef",
  first_name: "Ben",
  avatar: "http://res.cloudinary.com/chimeraggeddon/image/upload/c_scale,h_200,w_200/v1528483679/20180608_144443.jpg"

  )
ben.save!

Friendship.create!({
  user: brett,
  friend_user: ben
})

Friendship.create!({
  user: ben,
  friend_user: brett
})

CHARACTER_AND_DIALOGUE_MOVIES = ["Forrest Gump", "Alien", "American Beauty", "terminator 2", "Shawshank Redemption",
"Moonlight", "The Dark Knight", "Star Wars", "The Green Mile", "Back to the Future", "1984", "A Clockwork Orange",
"Moon", "V for Vendetta", "Fight Club", "A League of Their Own", "Before Sunrise", "Before Sunset", "Before Midnight"]

DBMOVIES = {
  "Forrest Gump" => [],
  "Alien" => [],
  "American Beauty" => [],
  "terminator 2" => [],
  "Let the Right One In" => [],
  "The Place Beyond the Pines" => [],
  "Shawshank Redemption" => [],
  "Moonlight" => [],
  "Eyes Wide Shut" => [],
  "The Dark Knight" => [],
  "Star Wars" => [],
  "The Green Mile" => [],
  "Event Horizon" => [],
  "Primer" => [],
  "Back to the Future" => [],
  "Blade Runner" => [],
  "Arrival" => [],
  "Prometheus" => [],
  "Mad Max: Fury Road" => [],
  "1984" => [],
  "A Clockwork Orange" => [],
  "Dark City" => [],
  "Elysium" => [],
  "Escape from New York" => [],
  "Gattaca" => [],
  "Hobo with a Shotgun" => [],
  "Idiocracy" => [],
  "In Time" => [],
  "The Lobster" => [],
  "The Maze Runner" => [],
  "Moon" => [],
  "Outland" => [],
  "The Postman" => [],
  "Repo Man" => [],
  "A Scanner Darkly" => [],
  "Tank Girl" => [],
  "V for Vendetta" => [],
  "27 Dresses" => ["Characters"],
  "P.S. I Love You" => ["Characters"],
  "The Ugly Truth" => [],
  "How to Lose a Guy in 10 Days" => [],
  "Fool's Gold" => [],
  "No Strings Attached" => [],
  "Friends With Benefits" => ["Characters"],
  "She's All That" => [],
  "Failure to Launch" => [],
  "What Happens in Vegas" => [],
  "Ghosts of Girlfriends Past" => [],
  "All About Steve" => [],
  "Couples Retreat" => [],
  "Killers" => [],
  "When in Rome" => [],
  "Leap Year" => [],
  "A Little Bit of Heaven" => [],
  "Chasing Liberty" => [],
  "New Year's Eve" => [],
  "Just Go With It" => [],
  "This Means War" => [],
  "Baggage Claim" => [],
  "Aloha" => [],
  "Barton Fink" => [],
  "Fight Club" => [],
  "Clueless" => [],
  "The Wizard of Oz" => [],
  "Get Out" => [],
  "Metropolis" => [],
  "A League of Their Own" => [],
  "Casablanca" => [],
  "King Kong" => [],
  "Footloose" => [],
  "Toy Story" => [],
  "Up" => [],
  "Manchester by the Sea" => [],
  "Sunset Boulevard" => [],
  "American Psycho" => [],
  "Vertigo" => [],
  "Nightmare on Elm Street" => [],
  "Lost Boys" => [],
  "Before Sunrise" => [],
  "Before Sunset" => [],
  "Before Midnight" => [],
  "Titanic" => [],
  "Biloxi Blues" => [],
  "Inception" => [],
  "Shutter Island" => []
}

TAGS = [
  "Story Arch",
  "Acting",
  "Characters",
  "Smart Lead",
  "Effects",
  "Dialogue",
  "Diversity",
  "Morbid",
  "Cool Villain",
  "Storyline",
  "Explosions",
  "Witty"
]

# ----------- TAG SEED ------------

TAGS.each do |tag|
  newtag = Tag.new(name: tag)
  newtag.save!
end

# ----------- MOVIE SEED ------------

genre_array = []
movie_genre_hash = {}


DBMOVIES.each do |dbmovie, tag_array|
  begin
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

    tag_array.each do |tag_name|
      tag = Tag.find_by(name: tag_name)
      MovieTag.create!(movie: movie, tag: tag, user: user)
    end

    genre_movie = moviejson["Genre"].split(",")
    genre_movie.each do |genre_alone|
      genre_alone.strip!
      genre_array << genre_alone
      movie_genre_hash[moviejson["Title"]] = genre_movie

    end
    puts "#{dbmovie} added"
  rescue Exception => e
    puts "Error adding #{dbmovie}"
    puts e
  end

end

character_tag = Tag.find_by(name: "Characters")
dialogue_tag = Tag.find_by(name: "Dialogue")

["Before Sunrise", "Forrest Gump", "A League of Their Own"].each do |title|
  movie = Movie.find_by(title: title)
    user_movie = UserMovie.new(
      user_id: brett.id,
      movie_id: movie.id,
      watched: true
    )
    user_movie.save!
  MovieTag.create!(movie: movie, user: brett, tag: character_tag)
  MovieTag.create!(movie: movie, user: brett, tag: dialogue_tag)
end


CHARACTER_AND_DIALOGUE_MOVIES.each do |movie_name|
  movie = Movie.find_by(title: movie_name)
  MovieTag.create(movie: movie, tag: character_tag, user: User.all.sample)
  MovieTag.create(movie: movie, tag: dialogue_tag, user: User.all.sample)
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


User.where.not(first_name: "Ben").all.each do |user|
  unique_movies = @movies.sample(20)
  unique_movies.each do |movie|
    random_boolean = [true, false].sample

    user_movie = UserMovie.new(
      user_id: user.id,
      movie_id: movie.id,
      watched: random_boolean

      )
    user_movie.save!
  end
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

# # ----------- REVIEW SEED ------------

# unique_user_movies.each do |movie|
#   review = Review.new(
#     text: Faker::Lorem.paragraph,
#     user_id: User.first.id,
#     movie_id: movie.id
#     )
#   review.save!
# end

# # ----------- FRIENDSHIPS SEED ------------

# User.all.each do |user|

#   friends = User.where.not(id: user.id).sample(3)

#   friends.each do |friend|

#     friendship = Friendship.new(
#       user_id: user.id,
#       friend_user_id: friend.id
#       )
#     friendship.save!
#   end
# end

# unique_users_who_are_not_the_first_user = User.where.not(id: User.first.id).sample(3)

# unique_users_who_are_not_the_first_user.each do |user|
#   friendship = Friendship.new(
#     user_id: User.first.id,
#     friend_user_id: user.id
#     )
#   friendship.save!
# end

# unique_users_who_are_not_the_second_user = User.where.not(id: User.second.id).sample(3)

# unique_users_who_are_not_the_first_user.each do |user|
#   friendship = Friendship.new(
#     user_id: User.second.id,
#     friend_user_id: user.id
#     )
#   friendship.save!
# end
