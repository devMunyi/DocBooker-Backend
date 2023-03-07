require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before do
    @doctor = FactoryBot.create(:doctor)
    @user = FactoryBot.create(:user)
  end

  describe 'Creating a new reservation' do
    it 'should be valid when a reservation includes doctor_id, user_id, date and details fields' do
      new_reservation = FactoryBot.build(:reservation, doctor: @doctor, user: @user)
      expect(new_reservation).to be_valid
    end

    it 'should not allow the reservation to be created without a doctor_id' do
      new_reservation = FactoryBot.build(:reservation, doctor_id: nil, user: @user)
      expect(new_reservation).not_to be_valid
    end

    it 'should not allow the reservation to be created without a user_id' do
      new_reservation = FactoryBot.build(:reservation, doctor_id: @doctor.id, user_id: nil)
      expect(new_reservation).not_to be_valid
    end

    it 'should not allow the reservation to be created without a date' do
      new_reservation = FactoryBot.build(:reservation, doctor_id: @doctor.id, date: nil)
      expect(new_reservation).not_to be_valid
    end
  end
end
