class Api::V1::AuthController < ApplicationController
  def login
    login_user = User.find_by(name: params[:name], password: params[:password])
    if !login_user.nil?
      render json: { message: 'Successfully logged in', token: login_user.token }, status: 200
    else
      render json: { error: 'Something might be wrong.' }, status: 404
    end
  end
end
