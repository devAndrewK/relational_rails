require 'rails_helper'

RSpec.describe 'edit a tour' do
  it 'can go to tour show and edit a tour' do
    heilung = Tour.create!(name: 'Heilung', sold_out: true, merch_on_hand: 3000)

    visit "/tours"

    click_button 'Edit'

    expect(current_path).to eq("/tours/#{heilung.id}/edit")

    fill_in 'name', with: 'Wardruna'
    fill_in 'merch_on_hand', with: '650'
    choose 'sold_out_false'

    click_button 'Update Tour'
    expect(current_path).to eq('/tours')
    expect(page).to have_content('Wardruna')
  end

  it 'can go to tour show and edit a tour' do
    heilung = Tour.create!(name: 'Heilung', sold_out: false, merch_on_hand: 3000)

    visit "/tours/#{heilung.id}"

    click_button 'Update Tour'

    expect(current_path).to eq("/tours/#{heilung.id}/edit")

    fill_in 'name', with: 'Wardruna'
    fill_in 'merch_on_hand', with: '650'
    choose 'sold_out_true'

    click_button 'Update Tour'
    expect(current_path).to eq('/tours')
    expect(page).to have_content('Wardruna')
  end
end