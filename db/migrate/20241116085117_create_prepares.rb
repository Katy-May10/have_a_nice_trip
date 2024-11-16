class CreatePrepares < ActiveRecord::Migration[7.0]
  def change
    create_table :prepares do |t|

      t.timestamps
    end
  end
end
