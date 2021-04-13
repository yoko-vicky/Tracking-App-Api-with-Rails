class AuthController < ApplicationController
  def login
    user = User.find_by(name: params[:name])
    if !user.nil?
      if user.authenticate(params[:password])
        render json: { message: 'Successfully logged in', token: user.token }, status: 200
      else
        render json: { error: 'Password is wrong.' }, status: 404
      end
    else
      render json: { error: 'The username does not exist' }, status: 404
    end
  end
end
