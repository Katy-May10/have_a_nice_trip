class AddIconTypeToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :icon_id, :integer
  end
end
