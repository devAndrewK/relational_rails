require 'rails_helper'

RSpec.describe "venues index page", type: :feature do
  it "can see a list of venue names" do
    tour_1 = Tour.create!(name:       "Gojira",
                         merch_on_hand:      100,
                         sold_out: false)
    venue_1 = Venue.create!(name: "The Rave",
                            capacity: 5000,
                            all_ages: true,
                            city: "Milwaukee",
                            tour_id: tour_1.id)                     
    venue_2 = Venue.create!(name: "Reggie's",
                            capacity: 500,
                            all_ages: true,
                            city: "Chicago",
                            tour_id: tour_1.id)                     

    visit "/venues"
    expect(page).to have_content(venue_1.name)
    expect(page).to have_content(venue_2.name)
  end

  it "orders tours by most recently created first" do
    tour_1 = Tour.create!(name:       "Gojira",
                          merch_on_hand:      100,
                          sold_out: false)
    venue_1 = Venue.create!(name: "The Rave",
                            capacity: 5000,
                            all_ages: true,
                            city: "Milwaukee",
                            tour_id: tour_1.id)                     
    venue_2 = Venue.create!(name: "Reggie's",
                            capacity: 500,
                            all_ages: true,
                            city: "Chicago",
                            tour_id: tour_1.id)

    visit "/venues"    
    expect 
  end
end