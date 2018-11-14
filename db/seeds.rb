# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(
    username: Faker::Internet.username,
    password: Faker::Internet.password(8),
    email: Faker::Internet.email,
    name: Faker::Name.name,
    location: Faker::Number.number(5)
  )
end

  10.times do
    Dog.create(
      name: Faker::Creature::Dog.name,
      age: Faker::Number.between(1, 20),
      sex: Faker::Creature::Dog.gender,
      breeds: Faker::Dog.breed,
      size: Faker::Creature::Dog.size,
      user_id: Faker::Number.between(1, 10)
    )
  end

  10.times do
    Event.create(


    )
  end
