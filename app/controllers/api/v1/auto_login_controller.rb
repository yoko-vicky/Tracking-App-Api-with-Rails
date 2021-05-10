module Api
  module V1
    class AutoLoginController < ApplicationController
      def create
        @user = User.find(user_params[:user_id])

        if @user
          render json: { logged_in: true, user: user_data(@user) }
        else
          render json: { error: 'Please provide correct token' }, status: 401
        end
      end

      private

      def user_params
        params.require(:user).permit(:user_id)
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
  end
end
