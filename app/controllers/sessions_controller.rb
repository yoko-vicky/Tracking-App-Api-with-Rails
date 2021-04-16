class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    @user = User.find_by(username: session_params[:username])

    if @user&.authenticate(session_params[:password])
      login!
      render json: { logged_in: true, user: @user }
    else
      render json: { status: 401, errors: ['Please provide correct username and password'] }
    end
  end

  def destroy
    logout!
    render json: { status: 200, logged_out: true }
  end

  def logged_in?
    if login? && current_user
      render json: { logged_in: true, user: current_user }
    else
      render json: { logged_in: false, message: 'no such user' }
    end
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
