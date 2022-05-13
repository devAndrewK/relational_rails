class Tour < ApplicationRecord
    has_many :venues
    validates_presence_of :name
    validates_presence_of :merch_on_hand
    validates_presence_of :sold_out
end
