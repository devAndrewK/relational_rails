# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Venue.destroy_all
Tour.destroy_all

gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
polyphia = Tour.create!(name: 'Polyphia', sold_out: false, merch_on_hand: 750)
heilung = Tour.create!(name: 'Heilung', sold_out: true, merch_on_hand: 3000)

gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
    city: 'Milwaukee')
gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
    city: 'Boston')
gojira.venues.create!(name: 'Pier 17', capacity: 4000, all_ages: true, 
    city: 'New York')
gojira.venues.create!(name: 'Mohegan Sun Arena', capacity: 3500, all_ages: false, 
     city: 'Washington, DC')

polyphia.venues.create!(name: 'House of Blues', capacity: 1200, all_ages: true, 
    city: 'Houston')
polyphia.venues.create!(name: 'The Masquerade', capacity: 1000, all_ages: true, 
    city: 'Atlanta')
polyphia.venues.create!(name: 'Concord Music Hall', capacity: 2000, all_ages: true, 
    city: 'Chicago')
polyphia.venues.create!(name: 'Gothic Theater', capacity: 1100, all_ages: false, 
    city: 'Denver')

heilung.venues.create!(name: 'Radius', capacity: 2500, all_ages: true, 
    city: 'Chicago')
heilung.venues.create!(name: 'Myth Live', capacity: 2000, all_ages: true, 
    city: 'St. Paul')
heilung.venues.create!(name: 'Stage AE', capacity: 5000, all_ages: true, 
    city: 'Pittsburgh')
heilung.venues.create!(name: 'Paramount Theatre', capacity: 2800, all_ages: false, 
    city: 'Seattle')