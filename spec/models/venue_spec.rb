require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe 'validations' do
      it { should validate_presence_of :name }
      it { should validate_presence_of :capacity }
      it { should validate_presence_of :all_ages }
      it { should validate_presence_of :city }
  end

  describe 'relationships' do
      it { should belong_to :tour }
  end

end
