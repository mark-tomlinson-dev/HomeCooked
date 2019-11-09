class AddTimeToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :time, :time
  end
end
