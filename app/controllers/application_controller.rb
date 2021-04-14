class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def login!
    session[:user_id] = @user.id
  end

  def login?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session.clear
    # session[:user_id] = nil
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end
end
