class Booking < ApplicationRecord
  belongs_to :swimming_pool
  belongs_to :user

  validates :date, presence: true
  validates :status, inclusion: { in: %w[pending accept reject] }
end
