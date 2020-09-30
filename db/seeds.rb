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
  'cLydFlVg-wI',
  '8cnrwlAWqx7',
  'auSYhIqAZq0',
  '7AqWZQIaCQf',
  '1YoE664mJTd',
  '7FJFzi2gCfE',
  'agRfCozhf5k',
  'dptlMEX4tF_',
  '9TN4PyhWvz1',
  '6GBcyh7RSuB',
  '13AL0KYItKD']

manufacturers = Manufacturer.all
themes = Theme.all

ids.each do |id|
  url = "https://poly.googleapis.com/v1/assets/#{id}/?key=#{ENV['POLY_API_KEY']}";
  asset = JSON.parse(open(url).read)

  furniture = Furniture.create!(
    poly_id: id,
    name: asset['displayName'],
    description: Faker::Marketing.buzzwords,
    price: (50..200).to_a.sample,
    manufacturer: manufacturers.sample,
    rating: Faker::Number.between(from: 0, to: 5),
    dimension_height: Faker::Number.between(from: 600, to: 800),
    dimension_width: Faker::Number.between(from: 600, to: 800),
    theme: themes.sample,
    preset: Faker::Boolean.boolean,
    thumbnail_url: asset['thumbnail']['url']
    )
  p "Furniture #{furniture.name} created"
end

# seeding presets

preset_ids = ['3txPAhYeu-x','13AL0KYItKD']

themes.each do |theme|
  url = "https://poly.googleapis.com/v1/assets/#{preset_ids[0]}/?key=#{ENV['POLY_API_KEY']}";
  asset = JSON.parse(open(url).read)

  furniture = Furniture.create!(
    poly_id: preset_ids[0],
    name: asset['displayName'],
    description: Faker::Marketing.buzzwords,
    price: (50..200).to_a.sample,
    manufacturer: manufacturers.sample,
    rating: Faker::Number.between(from: 0, to: 5),
    dimension_height: Faker::Number.between(from: 600, to: 800),
    dimension_width: Faker::Number.between(from: 600, to: 800),
    theme: Theme.find_by(name: theme.name),
    preset: true,
    thumbnail_url: asset['thumbnail']['url']
    )
  p "Furniture #{furniture.name} created"
end

themes.each do |theme|
  url = "https://poly.googleapis.com/v1/assets/#{preset_ids[1]}/?key=#{ENV['POLY_API_KEY']}";
  asset = JSON.parse(open(url).read)

  furniture = Furniture.create!(
    poly_id: preset_ids[1],
    name: asset['displayName'],
    description: Faker::Marketing.buzzwords,
    price: (50..200).to_a.sample,
    manufacturer: manufacturers.sample,
    rating: Faker::Number.between(from: 0, to: 5),
    dimension_height: Faker::Number.between(from: 600, to: 800),
    dimension_width: Faker::Number.between(from: 600, to: 800),
    theme: Theme.find_by(name: theme.name),
    preset: true,
    thumbnail_url: asset['thumbnail']['url']
    )
  p "Furniture #{furniture.name} created"
end
