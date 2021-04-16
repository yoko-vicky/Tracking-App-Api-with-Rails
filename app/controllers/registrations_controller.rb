class RegistrationsController < ApplicationController
  def signup
    @user = User.create(registrations_params)

    if @user.valid?
      login!
      render json: { status: :created, user: @user }
    else
      render json: { status: 401, errorMsgs: @user.errors.full_messages }
    end
  end

  private

  def registrations_params
    params.require(:user).permit(:username, :password)
  end
end
