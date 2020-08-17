class SwimmingPool < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :location, presence: true
  validates :size, presence: true
  validates :capacity, presence: true
end
