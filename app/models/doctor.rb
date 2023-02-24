class Doctor < ApplicationRecord
  has_many :reservations

  # Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :specialization, presence: true, length: { maximum: 255 }
  validates :picture, presence: true
end
