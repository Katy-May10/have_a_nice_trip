class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.integer :icon_id,      null: false
      t.string :time
      t.text :content,         null: false
      t.references :itinerary, null: false, foreign_key: true
      t.timestamps
    end
  end
end
