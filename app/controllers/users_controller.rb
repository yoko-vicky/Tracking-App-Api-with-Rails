class UsersController < ApplicationController
  before_action :authorized, only: [:show]
  # INDEX IS ONLY FOR DEVELOPMENT
  # def index
  #   @users = User.all
  #   render json: @users, status: 200
  # end

  def show
    render json: @current_user, status: 200
  end

  # SIGNUP
  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { status: :created, user: @user, token: token }, status: 200
    else
      render json: { status: 500, errorMsgs: @user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
