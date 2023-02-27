class Api::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  def index
    @reservations = Reservation.all.where(user_id: params[:user_id])
    render json: @reservations
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
