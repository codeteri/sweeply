class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :title, presence: true, uniqueness: true
  validates :rate, presence: true
  validates :suburb, presence: true
  validates :description, length: { maximum: 500 }
  validates :type, presence: true, inclusion: { in: %w[job service],
                                                message: "Please choose either 'job' or 'service'." }
end