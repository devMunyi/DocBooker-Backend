class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :user, nullify: true

  validates :doctor_id, :user_id, :date, :details, presence: true
  validate :date_cannot_be_in_the_past

  private

  def date_cannot_be_in_the_past
    return unless date.present? && date < Date.today

    errors.add(:date, "can't be in the past")
  end
end
