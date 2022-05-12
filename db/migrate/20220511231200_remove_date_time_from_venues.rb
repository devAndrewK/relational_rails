class RemoveDateTimeFromVenues < ActiveRecord::Migration[5.2]
  def change
    remove_column :venues, :datetime, :string
  end
end
