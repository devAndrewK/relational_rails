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
end