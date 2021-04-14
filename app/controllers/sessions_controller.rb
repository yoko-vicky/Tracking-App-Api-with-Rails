class SessionsController < ApplicationController
  def login
    # @user = User.find_by(username: session_params[:username])
    @user = User.find_by(username: session_params[:username])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      render json: { logged_in: true, user: @user }
    else
      render json: { status: 401, errors: ['Please provide correct username and password'] }
    end
  end

  def logout
    session[:user_id] = nil
    render json: { status: 200, logged_out: true }
  end

  def logged_in?
    if @current_user
      render json: { logged_in: true, user: current_user }
    else
      render json: { logged_in: false, message: 'User does not exist.' }
    end
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end

# class SessionsController < ApplicationController
#   def new; end

#   def create
#     @user = User.find_by(name: params[:session][:name])
#     if @user
#       session[:user_id] = @user.id
#       flash[:notice] = 'Successfully logged in...'
#       redirect_to user_path(@user)
#     else
#       flash[:alert] = 'Something is wrong'
#       render :new
#     end
#   end

#   def destroy
#     session[:user_id] = nil
#     flash[:notice] = 'Successfully logged out'
#     redirect_to root_path
#   end
# end
