class AddColumnsToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :message, :string
    add_column :bookings, :number_people, :integer
  end
end
