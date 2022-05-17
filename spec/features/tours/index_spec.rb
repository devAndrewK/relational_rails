require 'rails_helper'

RSpec.describe "tours index page", type: :feature do
  it "can see a list of tour names" do
    tour_1 = Tour.create(name:       "Gojira",
                         merch_on_hand:      100,
                         sold_out: false)
    tour_2 = Tour.create(name:       "All That Remains",
                         merch_on_hand:      100,
                         sold_out: false)

    visit "/tours"

  

    expect(page).to have_content(tour_1.name)
    expect(page).to have_content(tour_2.name)
  end

  it "orders tours by most recently created first" do
    gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
    polyphia = Tour.create!(name: 'Polyphia', sold_out: false, merch_on_hand: 750)
    heilung = Tour.create!(name: 'Heilung', sold_out: true, merch_on_hand: 3000)

    visit "/tours"    
    expect(heilung.name).to appear_before(gojira.name)
  end

  it 'can go to tour edit page from tour index' do
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
end