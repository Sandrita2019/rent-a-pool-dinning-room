class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :swimming_pool
      t.references swimming_pool:, null: false, foreign_key: true
      t.string :user
      t.references user:, null: false, foreign_key: true

      t.timestamps
    end
  end
end
