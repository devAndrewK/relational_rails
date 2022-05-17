require 'rails_helper'

RSpec.describe 'edit a tour' do
  it 'can go to tour show and edit a tour' do
    heilung = Tour.create!(name: 'Heilung', sold_out: true, merch_on_hand: 3000)

    visit "/tours"

    click_button 'Edit'

    expect(current_path).to eq("/tours/#{heilung.id}/edit")

    fill_in 'name', with: 'Wardruna'
    click_button 'Update Tour'
    expect(current_path).to eq('/tours')
    expect(page).to have_content('Wardruna')
  end
end