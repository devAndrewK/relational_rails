require 'rails_helper'

RSpec.describe "tours id page", type: :feature do
  it "can see tour names, merch counts, and whether it is sold out" do
    tour_1 = Tour.create!(name:       "Gojira",
                         merch_on_hand:      100,
                         sold_out: false)
    tour_2 = Tour.create!(name:       "All That Remains",
                         merch_on_hand:      100,
                         sold_out: false)

    visit "/tours/#{tour_1.id}"


    expect(page).to have_content(tour_1.name)
    expect(page).to_not have_content(tour_2.name)
    expect(page).to have_content("Sold Out: #{tour_1.sold_out}")
    expect(page).to have_content("Merch Items: #{tour_1.merch_on_hand}")
  end

  it "shows count of venues on that tour" do
    gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
    rave = gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
        city: 'Milwaukee')
    agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
        city: 'Boston')

    visit "/tours/#{gojira.id}"
    
    expect(page).to have_content("Venues: 2")
        
  end


end