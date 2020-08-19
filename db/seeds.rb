# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'Creating swimming pools....'

6.times do
  swimming_pool = SwimmingPool.new(
    title: Faker::FunnyName.two_word_name,
    description: Faker::ChuckNorris.fact,
    size: rand(10..100),
    location: Faker::Address.street_address,
    capacity: rand(2..10)
  )
  user = User.create!(
    email: Faker::Internet.email,
    password: "123456"
    )
  swimming_pool.user = user
  swimming_pool.save!
end
puts 'Finished!'
