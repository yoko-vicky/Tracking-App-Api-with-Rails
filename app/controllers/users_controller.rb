class UsersController < ApplicationController
  before_action :authorized, only: [:show]

  def show
    render json: @current_user, status: 200
  end

  # SIGNUP
  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { status: :created, user: @user, token: token }, status: 201
    else
      render json: { errorMsgs: @user.errors.full_messages }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
