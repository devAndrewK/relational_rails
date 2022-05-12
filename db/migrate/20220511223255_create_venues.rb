class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :capacity
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :all_ages
      t.string :city

      t.timestamps
    end
  end
end
