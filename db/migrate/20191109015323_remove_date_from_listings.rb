class RemoveDateFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :date, :date
  end
end
