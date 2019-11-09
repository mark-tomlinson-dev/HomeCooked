class AddDatetimeToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :date, :datetime
  end
end
