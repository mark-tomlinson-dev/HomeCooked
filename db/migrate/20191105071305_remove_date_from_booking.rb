class RemoveDateFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date, :datetime
  end
end
