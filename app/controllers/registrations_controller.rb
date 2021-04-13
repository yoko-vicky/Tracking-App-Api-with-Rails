class SessionsController < ApplicationController
  # def login
  #   user = User.find_by(name: params[:name])
  #   if !user.nil?
  #     if user.authenticate(params[:password])
  #       render json: { message: 'Successfully logged in', token: user.token }, status: 200
  #     else
  #       render json: { error: 'Password is wrong.' }, status: 404
  #     end
  #   else
  #     render json: { error: 'The username does not exist' }, status: 404
  #   end
  # end

  def signup
    @user = User.new(registrations_params)

    if @user.save
      login!
      render json: { status: :created, user: @user }
    else
      render json: { status: 500 }
    end
  end

  private

  def registrations_params
    params.require(:user).permit(:username, :password_digest, :token)
  end
end
