class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :date, presence: true
  validates :status, presence: true
  validates :message, length: { maximum: 500 }
end
