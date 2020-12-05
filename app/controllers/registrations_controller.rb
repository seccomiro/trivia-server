class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @user = User.new(sign_up_params)
    if @user.save
      render json: { status: :success, data: { user: { email: @user.email } } }
    else
      render json: { status: :fail, data: { errors: @user.errors } }, status: :unauthorized
    end
  end

  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation)
  end
end
