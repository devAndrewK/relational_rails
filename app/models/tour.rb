class Tour < ApplicationRecord
    has_many :venues
    validates_presence_of :name
    validates_presence_of :merch_on_hand
    validates :sold_out, inclusion: [ true, false ]

    # def count

    # end
end
