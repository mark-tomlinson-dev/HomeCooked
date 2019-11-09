class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :picture

  validates :title, :description, :date, :price, :max_guests, :location, presence: true
end
