class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings, foreign_key: 'listings_id'
  has_many :bookings, foreign_key: 'bookings_id'

  validates :name, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :bio, length: { maximum: 500 }
end
