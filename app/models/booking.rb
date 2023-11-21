class Booking < ApplicationRecord
  belongs_to :user
  validates :listings, presence: true
end
