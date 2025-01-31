class Api::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_error

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
    reservation = Reservation.where(id: params[:id]).joins(:doctor)
    render json: reservation.select('reservations.id',
                                    'reservations.date',
                                    'doctors.name AS doctorName',
                                    'doctors.specialization',
                                    'doctors.picture AS doctorpicture',
                                    'doctors.id AS doctorId',
                                    'reservations.user_id AS userId').first
  end

  def create
    @new_reservation = Reservation.new(reservation_params)

    begin
      @new_reservation.save!
      render json: @new_reservation, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { message: e.record.errors.full_messages.join(', ') }, status: :unprocessable_entity
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
    record_not_found unless @reservation
  end

  def reservation_params
    params.require(:reservation).permit(:doctor_id, :user_id, :date, :details)
  end

  def record_not_found
    render json: { error: 'Record not found' }, status: :not_found
  end

  def unprocessable_entity_error(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
