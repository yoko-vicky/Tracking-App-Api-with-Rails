class UsersController < ApplicationController
  before_action :set_user, only: [:login]
  before_action :authorized, only: [:show]

  def show
    render json: @current_user, status: 200
  end

  # SIGNUP
  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { status: :created, user: user_data(@user), token: token }, status: 201
    else
      render json: { errorMsgs: @user.errors.full_messages }, status: 422
    end
  end

  def login
    @user = User.find_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { logged_in: true, user: user_data(@user), token: token }
    else
      render json: { error: 'Please provide correct username and password' }, status: 401
    end
  end

  private

  def set_user
    @user = User.find_by(username: user_params[:username])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def user_data(user)
    obj = {
      id: user.id,
      username: user.name,
      admin: user.admin,
      token: user.token
    }
    obj
  end
end
