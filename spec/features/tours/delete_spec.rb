require 'rails_helper'

RSpec.describe 'delete a tour' do
  it 'can go to tour index and delete a tour' do
    heilung = Tour.create!(name: 'Heilung', sold_out: true, merch_on_hand: 3000)

    visit '/tours'

    click_button 'Delete Heilung'

    expect(current_path).to eq('/tours')
    expect(page).to_not have_content(heilung.name)
    expect(page).to_not have_button('Delete Heilung')
  end
end