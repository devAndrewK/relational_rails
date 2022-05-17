require 'rails_helper'

RSpec.describe 'Tours venues index' do
    it 'shows all of the venues on the specific tour' do
        gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
        rave = gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
            city: 'Milwaukee')
        agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
            city: 'Boston')

        visit "/tours/#{gojira.id}/venues"

        expect(page).to have_content(rave.name)
        expect(page).to have_content(agganis.name)
    end
    it 'links to each venue show page' do
        gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
        rave = gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
            city: 'Milwaukee')
        agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
            city: 'Boston')
        visit "/tours/#{gojira.id}/venues"

        click_on rave.name

        expect(current_path).to eq("/venues/#{rave.id}")
    end

    it "has a link to sort venues in alphabetical order" do
        gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
        rave = gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
            city: 'Milwaukee')
        agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
            city: 'Boston')
        pier = gojira.venues.create!(name: 'Pier 17', capacity: 4000, all_ages: true, 
            city: 'New York')
        mohegan = gojira.venues.create!(name: 'Mohegan Sun Arena', capacity: 3500, all_ages: false, 
            city: 'Washington, DC')

        visit "/tours/#{gojira.id}/venues"
        expect(rave.name).to appear_before(agganis.name)
        expect(pier.name).to appear_before(mohegan.name)
        click_link "Sort Alphabetically"
        expect(agganis.name).to appear_before(rave.name)
        expect(mohegan.name).to appear_before(pier.name)
    end

end