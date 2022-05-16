require 'rails_helper'

RSpec.describe Tour, type: :model do
    describe 'validations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :merch_on_hand }
        it { should allow_value(true).for(:sold_out) }
    end

    describe 'relationships' do
        it { should have_many :venues }
    end

    describe '#order_recent' do
        it "should order by most recent tour" do
            gojira = Tour.create!(name: 'Gojira', sold_out: false, merch_on_hand: 1000)
            polyphia = Tour.create!(name: 'Polyphia', sold_out: false, merch_on_hand: 750)
            heilung = Tour.create!(name: 'Heilung', sold_out: true, merch_on_hand: 3000)
            expect(Tour.order_recent).to eq([heilung, polyphia, gojira])
        end
    end

end