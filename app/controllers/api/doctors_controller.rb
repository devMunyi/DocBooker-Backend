class Api::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_error

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    render json: @doctor
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def update
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy
  end

  private

  def set_doctor
    @doctor = User.find(params[:id])
    record_not_found unless @doctor
  end

  def doctor_params
    params.require(:doctor).permit(:name, :email, :specialization, :picture)
  end

  def record_not_found
    render json: { error: 'Record not found' }, status: :not_found
  end

  def unprocessable_entity_error(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
