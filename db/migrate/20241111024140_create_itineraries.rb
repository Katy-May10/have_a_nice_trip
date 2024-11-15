class CreateItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :itineraries do |t|
      t.string :location, null: false
      t.date :departure
      t.date :arrival
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
