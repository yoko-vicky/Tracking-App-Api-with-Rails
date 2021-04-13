class UsersController < ApplicationController
  before_action :authenticate, except: %i[create]

  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user, status: 200
    else
      render json: { error: 'User not found' }, status: 404
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 200
    else
      render json: { error: 'Something might be wrong. User could not be created.' }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password_digest, :token)
  end
end
