class Venue < ApplicationRecord
    belongs_to :tour
    validates_presence_of :name
    validates_presence_of :capacity
    validates_presence_of :all_ages
    validates_presence_of :city
end
