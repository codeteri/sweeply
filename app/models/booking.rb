class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :listings, presence: true
end
