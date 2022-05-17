require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe 'validations' do
      it { should validate_presence_of :name }
      it { should validate_presence_of :capacity }
      it { should allow_value(true).for(:all_ages) }
      it { should validate_presence_of :city }
  end

  describe 'relationships' do
      it { should belong_to :tour }
  end

  describe "#only_all_ages" do
    it "only returns all ages shows" do
        gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
        rave = gojira.venues.create!(name: 'The Rave', capacity: 3500, all_ages: true, 
          city: 'Milwaukee')
        agganis = gojira.venues.create!(name: 'Agganis Arena', capacity: 3000, all_ages: true, 
          city: 'Boston')
        pier = gojira.venues.create!(name: 'Pier 17', capacity: 4000, all_ages: true, 
          city: 'New York')
        mohegan = gojira.venues.create!(name: 'Mohegan Sun Arena', capacity: 3500, all_ages: false, 
          city: 'Washington, DC')
          binding.pry

        expect(Venue.only_all_ages).to eq([rave, agganis, pier])

    end

  end

end
