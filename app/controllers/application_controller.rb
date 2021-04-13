class ApplicationController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods

  # def authenticate
  #   authenticate_or_request_with_http_token do |token, _options|
  #     auth_user = User.find_by(token: token)
  #     !auth_user.nil? ? true : false
  #   end
  # end

  skip_before_action :verify_authenticity_token

  helper_method :login!, :current_user

  def login!
    session[:user_id] = @user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
