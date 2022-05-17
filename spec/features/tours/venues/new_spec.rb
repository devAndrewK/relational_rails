require 'rails_helper'

RSpec.describe 'create new Venue attached to Tour' do
    it "links to new tour from tour/venues index" do
        gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
        rave = gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
            city: 'Milwaukee')
        agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
            city: 'Boston')
        visit "/tours/#{gojira.id}/venues"
        click_on "Create Venue"

        expect(current_path).to eq("/tours/#{gojira.id}/venues/new")

        fill_in 'name', with: 'Subterranean'
        fill_in 'city', with: 'Chicago'
        fill_in 'capacity', with: '500'
        choose 'all_ages_true'
        click_button 'Create Venue'

        expect(current_path).to eq("/tours/#{gojira.id}/venues")
        expect(page).to have_content("Subterranean")
    end

  end