class CreateSouvenirs < ActiveRecord::Migration[7.0]
  def change
    create_table :souvenirs do |t|

      t.timestamps
    end
  end
end
