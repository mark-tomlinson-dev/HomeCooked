class RemoveTimeFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :time, :time
  end
end
