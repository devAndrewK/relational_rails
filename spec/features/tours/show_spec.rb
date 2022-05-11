require 'rails_helper'

RSpec.describe "tours id page", type: :feature do
  it "can see tour names, merch counts, and whether it is sold out" do
    tour_1 = Tour.create(name:       "Gojira",
                         merch_on_hand:      100,
                         sold_out: false)
    # tour_2 = Tour.create(name:       "All That Remains",
    #                      merch_on_hand:      100,
    #                      sold_out: false)

    visit "/tours/#{tour_1.id}"

    save_and_open_page

    expect(page).to have_content(tour_1.name)
    expect(page).to have_content("Sold Out: #{tour_1.sold_out}")
    expect(page).to have_content("Merch Items: #{tour_1.merch_on_hand}")
    # expect(page).to have_content(tour_2.name)
    # expect(page).to have_content("Sold Out: #{tour_2.sold_out}")
    # expect(page).to have_content("Merch Items: #{tour_2.merch_on_hand}")
  end
end