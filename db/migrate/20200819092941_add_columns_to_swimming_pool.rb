class AddColumnsToSwimmingPool < ActiveRecord::Migration[6.0]
  def change
    add_column :swimming_pools, :title, :string
    add_column :swimming_pools, :description, :text
  end
end
