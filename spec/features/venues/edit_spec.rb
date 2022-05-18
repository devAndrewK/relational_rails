require 'rails_helper'

RSpec.describe 'edit a venue' do
  it 'can go to venue show and edit a venue' do
    gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
    agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: false, 
        city: 'Boston')

    visit "/venues/#{agganis.id}"

    click_link 'Update Venue'

    expect(current_path).to eq("/venues/#{agganis.id}/edit")

    fill_in 'name', with: 'Agganis Stadium'
    choose 'all_ages_true'

    click_button 'Update Venue'
    expect(current_path).to eq("/venues/#{agganis.id}")
    expect(page).to have_content('Agganis Stadium')
  end
end