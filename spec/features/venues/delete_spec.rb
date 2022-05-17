require 'rails_helper'

RSpec.describe 'delete a venue' do
  it 'can go to venue index and delete a venue' do
    gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
    agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
        city: 'Boston')

    visit '/venues'

    click_button 'Delete Agganis Arena'

    expect(current_path).to eq('/venues')
    expect(page).to_not have_content(agganis.name)
    expect(page).to_not have_button('Delete Agganis Arena')
  end
end