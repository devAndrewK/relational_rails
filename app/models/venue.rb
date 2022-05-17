class Venue < ApplicationRecord
    belongs_to :tour
    validates_presence_of :name
    validates_presence_of :capacity
    validates :all_ages, inclusion: [ true, false ]
    validates_presence_of :city

    def self.only_all_ages
        where(all_ages: :true)
    end
end
