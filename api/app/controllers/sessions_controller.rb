class SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      render json: { user: user }
    else
      render json: { error: "Invalid. Please try again."}, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {}, status: :ok
  end

  private
    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
