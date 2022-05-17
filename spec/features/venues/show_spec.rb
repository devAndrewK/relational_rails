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


    
    expect(page).to have_content(venue_1.name)
    end

    it 'can go to venue show page and delete a venue' do
        gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
        agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
            city: 'Boston')
    
        visit "/venues/#{agganis.id}"
    
        click_button 'Delete'
    
        expect(current_path).to eq('/venues')
        expect(page).to_not have_content(agganis.name)
        expect(page).to_not have_button('Delete Agganis Arena')
      end
  end