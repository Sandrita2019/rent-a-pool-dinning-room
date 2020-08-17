class CreateSwimmingPools < ActiveRecord::Migration[6.0]
  def change
    create_table :swimming_pools do |t|
      t.integer :capacity
      t.string :location
      t.integer :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
