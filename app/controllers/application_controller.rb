class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login?
    current_user ? true : false
  end

  def require_login
    return if login? && current_user

    render json: { message: 'Please login' }, status: :not_login
  end

  def require_same_user(user)
    # if current_user == user && user.token == authenticate_token
    #   render json: { user: user.name, token: user.token, status: :authorized }
    # else
    #   render json: { message: 'You can see only your own info' }, status: 404
    # end
    render json: { user: user.username, token: user.token, status: :authorized, current_user: current_user }
  end

  protected

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      auth_user = User.find_by(token: token)
      !auth_user.nil? ? auth_user.token : false
    end
  end

  def render_unauthorized
    render json: { message: 'token invalid' }, status: :unauthorized
  end

  # def authenticate
  #   authenticate_or_request_with_http_token do |token, _options|
  #     auth_user = User.find_by(token: token)
  #     !auth_user.nil? ? true : false
  #   end
  # end
end

# skip_before_action :verify_authenticity_token
