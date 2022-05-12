require 'rails_helper'

RSpec.describe "venues show page" do
it "can see tour venues" do
    tour_1 = Tour.create!(name:       "Gojira",
        merch_on_hand:      100,
        sold_out: false)
    venue_1 = Venue.create!(name: "The Rave",
                            capacity: 5000,
                            all_ages: true,
                            city: "Milwaukee",
                            tour_id: tour_1.id)
    tour_2 = Tour.create!(name:       "All That Remains",
                        merch_on_hand:      100,
                        sold_out: false)

    visit "/venues/#{venue_1.id}"

    save_and_open_page

    
    expect(page).to have_content(venue_1.name)
    end
  end