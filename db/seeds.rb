# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

DBMOVIES = [
  "Forest Gump",
  "Alien",
  "American Beauty",
  "Saving Private Ryan",
  "Let the Right One In",
  "The Hunt",
  "The Place Beyond the Pines",
  "Shawshank Redemption",
  "Moonlight",
  "Eyes Wide Shut",
  "The Dark Knight",
  "Star Wars A New Hope",
  "Star Wars Return of the Jedi",
  "Event Horizon",
  "Primer",
  "Back to the Future",
  "Blade Runner",
  "Arrival",
  "Prometheus",
  "Mad Max"
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

# Tag Seed

TAGS.each do |tag|
  newtag = Tag.new(name: tag)
  newtag.save!
end


  USERS = User.all

  # # Review seed when movie seed is done
  # MOVIES = Movie.all

  # review = Review.new(
  #   text: Faker::Lorem.paragraph
  #   user_id: USERS.sample
  #   movie_id: MOVIES.sample
  #   )
  # review.save!

10.times do
  movie = Movie.new(
    title: "Star Wars: Episode IV - A New Hope",
    year: 1978,
    runtime: 121,
    rating: "PG-13",
    plot: "The Imperial Forces, under orders from cruel Darth Vader, hold Princess Leia hostage in their efforts to quell the rebellion against the Galactic Empire. Luke Skywalker and Han Solo, captain of the Millennium Falcon, work together with the companionable droid duo R2-D2 and C-3PO to rescue the beautiful princess, help the Rebel Alliance and restore freedom and justice to the Galaxy.",
    director: "George Lucas",
    poster: "https://res.cloudinary.com/chimeraggeddon/image/upload/v1527776092/anewhope.jpg"
  )
  movie.save!
end
