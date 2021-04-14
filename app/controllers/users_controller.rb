class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, status: 200
    else
      render json: { error: 'User not found' }, status: 404
    end
  end
end
