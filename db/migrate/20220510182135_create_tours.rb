class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :sold_out
      t.integer :merch_on_hand

      t.timestamps
    end
  end
end
