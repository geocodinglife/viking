class SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      token = user.generate_jwt
      render json: { token: token }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

    private

  def sign_up_params
    params.require(:user).permit(:email, :password)
  end
end