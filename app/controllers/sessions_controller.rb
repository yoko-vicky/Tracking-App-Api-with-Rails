class SessionsController < ApplicationController
  before_action :authorized, only: %i[auto_login]
  before_action :set_user, except: %i[destroy]

  # LOGIN
  def create
    @user = User.find_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { logged_in: true, user: @user, token: token }
    elsif @user
      render json: { error: 'Please provide correct password' }, status: 404
    else
      render json: { error: 'Please provide correct username and password' }, status: 404
    end
  end

  # AUTO LOGIN
  def auto_login
    if logged_in_user
      render json: logged_in_user
    else
      render json: { error: 'No User Logged In' }
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
