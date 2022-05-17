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

  it "only shows all_ages shows" do
    gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
    rave = gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
      city: 'Milwaukee')
    agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
      city: 'Boston')
    pier = gojira.venues.create!(name: 'Pier 17', capacity: 4000, all_ages: true, 
      city: 'New York')
    mohegan = gojira.venues.create!(name: 'Mohegan Sun Arena', capacity: 3500, all_ages: false, 
       city: 'Washington, DC')

    visit '/venues'

    expect(page).to have_content(pier.name)
    expect(page).to have_content(rave.name)
    expect(page).to have_content(agganis.name)
    expect(page).to_not have_content(mohegan.name)
  end

  it 'can go to venue edit page from venue index' do
    gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
    rave = gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
      city: 'Milwaukee')
    agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
      city: 'Boston')
    pier = gojira.venues.create!(name: 'Pier 17', capacity: 4000, all_ages: true, 
      city: 'New York')
    mohegan = gojira.venues.create!(name: 'Mohegan Sun Arena', capacity: 3500, all_ages: false, 
       city: 'Washington, DC')

    visit "/venues"

    click_button 'Edit The Rave'

    expect(current_path).to eq("/venues/#{rave.id}/edit")

    fill_in 'name', with: 'Eagles Ballroom'

    click_button 'Update Venue'
    expect(current_path).to eq("/venues/#{rave.id}")
    expect(page).to have_content('Eagles Ballroom')
  end

end