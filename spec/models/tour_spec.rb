require 'rails_helper'

RSpec.describe Tour, type: :model do
    describe 'validations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :merch_on_hand }
        it { should validate_presence_of :sold_out }
    end

    describe 'relationships' do
        it { should have_many :venues }
    end

end