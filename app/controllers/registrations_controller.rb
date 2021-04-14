class RegistrationsController < ApplicationController
  # skip_before_action :verify_authenticity_token, raise: false

  def signup
    @user = User.create(registrations_params)

    if @user.valid?
      session[:user_id] = @user.id
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
