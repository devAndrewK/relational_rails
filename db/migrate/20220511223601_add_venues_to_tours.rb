class AddVenuesToTours < ActiveRecord::Migration[5.2]
  def change
    add_reference :venues, :tour, foreign_key: true
  end
end
