class Listing < ApplicationRecord
  belongs_to :user
  has_one :booking
  has_one_attached :photo

  geocoded_by :suburb
  after_validation :geocode, if: :will_save_change_to_suburb?

  validates :title, presence: true, uniqueness: true
  validates :rate, presence: true
  validates :suburb, presence: true
  validates :description, length: { maximum: 500 }
  validates :category, presence: true, inclusion: { in: %w[Job Service],
                                                    message: "Please choose either 'Job' or 'Service'." }
end
