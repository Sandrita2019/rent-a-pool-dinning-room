class SwimmingPool < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :capacity, :location, :size, presence: true
end
