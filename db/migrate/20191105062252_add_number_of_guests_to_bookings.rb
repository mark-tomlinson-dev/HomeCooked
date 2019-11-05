class AddNumberOfGuestsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :number_of_guests, :int
  end
end
