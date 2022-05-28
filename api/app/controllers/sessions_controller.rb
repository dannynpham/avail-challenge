class SessionsController < ApplicationController
  def create
    user = User.with_email(session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      session[:entered_code] = false
      render json: {}, status: :ok
    else
      render json: { error: 'Invalid. Please try again.' }, status: :unprocessable_entity
    end
  end

  def update
    render json: { user: current_user }, status: :ok and return if current_user && entered_code?

    if current_user&.authenticate_code(session_params[:code])
      session[:entered_code] = true
      render json: { user: current_user }, status: :ok
    else
      render json: { error: 'Invalid. Please try again.' }, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {}, status: :ok
  end

  private

  # Only allow a list of trusted parameters through.
  def session_params
    params.require(:session).permit(:email, :password, :code)
  end
end
