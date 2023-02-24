class UsersController < ApplicationController
  '''
  The User model has a unique index on the username column.
  If a user tries to create a record with a non-unique username, 
  the create action will return a 422 Unprocessable Entity status code with an error message
  indicating that the username has already been taken. Similarly, 
  if a user tries to update a record with a non-unique username, 
  the update action will return a 422 Unprocessable Entity status code with an error message
  indicating that the username has already been taken.
  '''

  before_action :set_user, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_error

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find_by(username: params[:id])

    unless @user
      render json: { error: 'Record not found' }, status: :not_found
    end
  end

  def user_params
    params.require(:user).permit(:username)
  end

  def record_not_found
    render json: { error: 'Record not found' }, status: :not_found
  end

  def unprocessable_entity_error(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
