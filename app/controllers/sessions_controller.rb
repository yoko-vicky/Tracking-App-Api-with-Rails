class SessionsController < ApplicationController
  before_action :authorized, only: %i[auto_login]
  before_action :set_user, except: %i[destroy]

  # LOGIN
  def create
    @user = User.find_by(username: session_params[:username])

    if @user&.authenticate(session_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { logged_in: true, user: @user, token: token }
    elsif @user
      render json: { error: 'Please provide correct password' }, status: 404
    else
      render json: { error: 'Please provide correct username and password' }, status: 404
    end
  end

  # LOGOUT
  def destroy
    render json: { status: 200, logged_out: true }
  end

  # AUTO LOGIN
  def auto_login
    render json: @user
  end

  private

  def set_user
    @user = User.find_by(username: session_params[:username])
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
