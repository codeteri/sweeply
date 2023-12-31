class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :date, presence: true
  validates :message, length: { maximum: 500 }

  def confirmed!
    self.confirmed = true
  end
end
