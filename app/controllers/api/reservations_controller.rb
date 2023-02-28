class Api::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  def index
    user_id = params[:user_id]
    doctor_id = params[:doctor_id]

    reservations = if doctor_id.present? && doctor_id.to_i.positive?
                     Reservation.where(user_id:, doctor_id:).joins(:doctor)
                   else
                     Reservation.where(user_id:).joins(:doctor)
                   end

    render json: reservations.select('reservations.id', 'reservations.date', 'doctors.name AS doctor_name',
                                     'doctors.specialization AS specialization', 'reservations.user_id')
  end

  def show
    render json: @reservation
  end

  def create
    @new_reservation = Reservation.new(reservation_params)

    if @new_reservation.save!
      render json: @new_reservation, status: :created
    else
      render json: @new_reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    head :no_content
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:doctor_id, :user_id, :date, :details)
  end
end
