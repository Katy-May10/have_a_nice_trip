class CreateSouvenirs < ActiveRecord::Migration[7.0]
  def change
    create_table :souvenirs do |t|
      t.string :who, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
