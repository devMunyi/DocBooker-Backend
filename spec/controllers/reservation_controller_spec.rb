require 'rails_helper'

RSpec.describe Api::ReservationsController, type: :request do
  before do
    @doctor = FactoryBot.create(:doctor)
    @user = FactoryBot.create(:user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get api_user_doctor_reservations_path(@doctor, @user)
      expect(response).to have_http_status(:success)
    end

    it 'returns all reservations' do
      FactoryBot.create(:reservation, doctor: @doctor, user: @user)
      FactoryBot.create(:reservation, doctor: @doctor, user: @user)
      get api_user_doctor_reservations_path(@doctor, @user)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'GET #show' do
    let!(:new_reservation) { FactoryBot.create(:reservation, doctor: @doctor, user: @user) }

    it 'returns http success' do
      get api_user_doctor_reservation_path(@user, @doctor, new_reservation)
      expect(response).to have_http_status(:success)
    end

    it 'returns the reservation' do
      get api_user_doctor_reservation_path(@user, @doctor, new_reservation)
      expect(JSON.parse(response.body)['id']).to eq(new_reservation.id)
    end
  end

  describe 'POST #create' do
    it 'creates a new reservation' do
      post api_user_doctor_reservations_path(@user, @doctor),
           params: { reservation: {
             doctor_id: @doctor.id,
             user_id: @user.id,
             date: Date.today,
             details: ''
           } }
      expect(response).to have_http_status(:created)
    end
  end
end
