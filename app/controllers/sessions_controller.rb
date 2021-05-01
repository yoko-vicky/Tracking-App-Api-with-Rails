class SessionsController < ApplicationController
  before_action :set_user

  # LOGIN
  def create
    @user = User.find_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { logged_in: true, user: @user, token: token }
    else
      render json: { error: 'Please provide correct username and password' }, status: 401
    end
  end

  private

  def set_user
    @user = User.find_by(username: user_params[:username])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
