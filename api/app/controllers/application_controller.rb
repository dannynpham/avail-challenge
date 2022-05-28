class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def entered_code?
    session[:entered_code] || false
  end

  def authenticate_user!
    return true if current_user.present? && entered_code?

    render json: { error: 'You must be logged in.' }, status: :unprocessable_entity
  end
end
