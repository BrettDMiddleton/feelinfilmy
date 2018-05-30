# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user = User.new(
  email: Faker::Internet.email,
  bio: "I love to watch documentaries.",
  password: "feelinfilmy",
  username: Faker::HarryPotter.character,
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name
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












