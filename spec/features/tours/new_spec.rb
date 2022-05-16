require 'rails_helper'

RSpec.describe 'create new Tour' do
    it "links to new tour from tour index" do
        visit "/tours"
        click_on "New Tour"

        expect(current_path).to eq("/tours/new")
    end

    it "creates a new tour" do
        visit "/tours/new"
        
        fill_in 'name', with: 'Tesseract'
        fill_in 'merch_on_hand', with: '500'
        click_button 'Create Tour'
        
        new_tour_id = Tour.last.id
        expect(current_path).to eq("/tours")
        expect(page).to have_content("Tesseract")
    end
  end