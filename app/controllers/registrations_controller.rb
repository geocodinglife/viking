class RegistrationsController < Devise::RegistrationsController
  def create  
    user = User.new(user_params)
    if user.save
      token = user.generate_jwt
      render json: { token: token }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end


  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      render json: { user: current_user }, status: :ok
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :id, *User::ROLES)
  end
end