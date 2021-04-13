class RegistrationsController < ApplicationController
  def login
    @user = User.find_by(username: session_params[:username])

    if @user&.authenticate(session_params[:password])
      login!
      render json: { logged_in: true, user: @user }
    else
      render json: { status: 401, errors: ['Sorry, login was failed.', 'Please provide correct username and password'] }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

  def logged_in?
    if @current_user
      render json: { logged_in: true, user: current_user }
    else
      render json: { logged_in: false, message: 'User does not exist.' }
    end
  end

  private

  def session_params
    params.require(:user).permit(:username, :password_digest, :token)
  end
end
