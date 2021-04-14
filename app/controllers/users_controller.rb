class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]
  before_action only: %i[show] do
    require_same_user(@user)
  end

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    if @user
      render json: @user, status: 200
    else
      render json: { error: 'User not found' }, status: 404
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
