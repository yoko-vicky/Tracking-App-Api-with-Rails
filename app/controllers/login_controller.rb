class LoginController < ApplicationController
  def create
    @user = User.find_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { logged_in: true, user: user_data(@user), token: token }
    else
      render json: { error: 'Please provide correct username and password' }, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def user_data(user)
    obj = {
      id: user.id,
      username: user.username,
      admin: user.admin
    }
    obj
  end
end
