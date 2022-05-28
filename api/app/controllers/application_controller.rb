class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'You must be logged in.' }, status: :unprocessable_entity
  end

  def entered_pin?
    render json: { error: 'You must enter pin number.' }, status: :unprocessable_entity unless session[:entered_pin]

    true
  end

  def authenticate_user!
    current_user.present? && entered_pin?
  end
end
