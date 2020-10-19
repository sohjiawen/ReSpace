# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

# cleaning database
UserTheme.destroy_all
User.destroy_all
Manufacturer.destroy_all
Theme.destroy_all
Furniture.destroy_all
p "Database has been cleaned"

# seeding users
20.times {
  user = User.create(email: Faker::Internet.email, password: '123123')
  p "User #{user.email} has been created"
}

# seeding manufacturers
10.times {
  manufacturer = Manufacturer.create(name: Faker::Company.name, url: Faker::Internet.url)
  p "Manufacturer #{manufacturer.name} has been created"
}

# seeding themes
Theme::THEMES.each do |theme|
  theme = Theme.create!(name: theme[:name], image_id: theme[:image_id])
  "#{theme.name} has been created"
end

# seeding furnitures
ids = [
  '7AqWZQIaCQf',
  '13AL0KYItKD',
  'eEuXH2lCby7'
]

manufacturers = Manufacturer.all
themes = Theme.all

ids.each do |id|
  url = "https://poly.googleapis.com/v1/assets/#{id}/?key=#{ENV['POLY_API_KEY']}";
  asset = JSON.parse(open(url).read)
  furniture = Furniture.new(
    poly_id: id,
    name: asset['displayName'],
    description: "This stool is a modern take on the ancient Japanese stool design. Architecturally inspired angles and the splash of colour bring out a unique chair that is both design forward and trendy.",
    price: (50..200).to_a.sample,
    manufacturer: manufacturers.sample,
    rating: Faker::Number.between(from: 0, to: 5),
    dimension_height: Faker::Number.between(from: 600, to: 800),
    dimension_width: Faker::Number.between(from: 600, to: 800),
    theme: themes.sample,
    preset: Faker::Boolean.boolean,
    )
    file = File.open(File.join(Rails.root, 'db','images',"#{furniture.name}.png"))
    furniture.image.attach(io: file, filename: asset['displayName'], content_type: 'image/png')
    furniture.save
  p "Furniture #{furniture.name} created"
end

# seeding minimalistic preset

min_preset_ids = ['cLydFlVg-wI', 'auSYhIqAZq0', 'c2AJ5OuKKxR']

min_preset_ids.each do |id|
  url = "https://poly.googleapis.com/v1/assets/#{id}/?key=#{ENV['POLY_API_KEY']}";
  asset = JSON.parse(open(url).read)

  furniture = Furniture.new(
    poly_id: id,
    name: asset['displayName'],
    description: "This stool is a modern take on the ancient Japanese stool design. Architecturally inspired angles and the splash of colour bring out a unique chair that is both design forward and trendy.",
    price: (50..200).to_a.sample,
    manufacturer: manufacturers.sample,
    rating: Faker::Number.between(from: 0, to: 5),
    dimension_height: Faker::Number.between(from: 600, to: 800),
    dimension_width: Faker::Number.between(from: 600, to: 800),
    theme: Theme.find_by(name:'Minimalist'),
    preset: true
    )

    file = File.open(File.join(Rails.root, 'db','images',"#{furniture.name}.png"))
    furniture.image.attach(io: file, filename: asset['displayName'], content_type: 'image/png')
    furniture.save
  p "Furniture #{furniture.name} created"
end

# seeding eclectic preset

eclec_preset_ids = ['6GBcyh7RSuB', 'cnDk3EzC3Gs']

eclec_preset_ids.each do |id|
  url = "https://poly.googleapis.com/v1/assets/#{id}/?key=#{ENV['POLY_API_KEY']}";
  asset = JSON.parse(open(url).read)

  furniture = Furniture.new(
    poly_id: id,
    name: asset['displayName'],
    description: "This stool is a modern take on the ancient Japanese stool design. Architecturally inspired angles and the splash of colour bring out a unique chair that is both design forward and trendy.",
    price: (50..200).to_a.sample,
    manufacturer: manufacturers.sample,
    rating: Faker::Number.between(from: 0, to: 5),
    dimension_height: Faker::Number.between(from: 600, to: 800),
    dimension_width: Faker::Number.between(from: 600, to: 800),
    theme: Theme.find_by(name:'Eclectic'),
    preset: true
    )
    
    file = File.open(File.join(Rails.root, 'db','images',"#{furniture.name}.png"))
    furniture.image.attach(io: file, filename: asset['displayName'], content_type: 'image/png')
    furniture.save
  p "Furniture #{furniture.name} created"
end
