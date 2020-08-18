class SwimmingPool < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :capacity, :location, :size, presence: true
end
