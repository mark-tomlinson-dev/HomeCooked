class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :max_guests
      t.decimal :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
