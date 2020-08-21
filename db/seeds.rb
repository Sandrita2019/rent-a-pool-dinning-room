# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "clean database"
Booking.delete_all
SwimmingPool.delete_all

require 'faker'

images_index = ["https://images.unsplash.com/photo-1593331009585-487e57a3ed4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80", "https://images.unsplash.com/photo-1521750465-672a0f580901?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80", "https://images.unsplash.com/photo-1509600110300-21b9d5fedeb7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1575429198097-0414ec08e8cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80", "https://images.unsplash.com/photo-1572331165267-854da2b10ccc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80", "https://images.unsplash.com/photo-1534009502677-4e5080efa8c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80", "https://images.unsplash.com/photo-1543489822-c49534f3271f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80", "https://images.unsplash.com/photo-1566027310099-a2ee398d7bcd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80", "https://images.unsplash.com/photo-1593331009596-2edac26c74ca?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80", "https://images.unsplash.com/photo-1580876206701-30de22e5326c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80", "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1477120128765-a0528148fed2?ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80"]

puts 'Creating swimming pools....'

6.times do
file = URI.open(images_index.shuffle!.pop)
  swimming_pool = SwimmingPool.new(
    title: Faker::FunnyName.two_word_name,
    description: Faker::ChuckNorris.fact,
    size: rand(10..100),
    location: ["Santa Margalida, 07450 Son Serra de Marina", "Carrer Germanor, 07459 Son Serra de Marina", "Camí de s'Estanyol, 07579 Artà", "Carrer de les Dones d' Aigua, 07579 Urbanització s'Estanyol", "Carrer Illots, 07579 Artà", "Colònia de Sant Pere, 07579", "Carrer de la Verge Maria, 07579 Colonia de Sant Pere"].shuffle!.pop,
    capacity: rand(2..10)
  )
  user = User.create!(
    email: Faker::Internet.email,
    password: "123456"
    )
  swimming_pool.photo.attach(io: file, filename: 'pool.jpg', content_type: 'image/jpg')
  swimming_pool.user = user
  swimming_pool.save!
end
puts 'Finished!'
