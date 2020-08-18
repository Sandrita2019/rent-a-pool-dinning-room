class SwimmingPool < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :capacity, presence: true
  validates :location, presence: true
  validates :size, presence: true
end
