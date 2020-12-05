class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @user = User.new(sign_up_params)
    if @user.save
      render json: { status: :success, data: {
        user: {
          email: @user.email,
          name: @user.name,
          token: JsonWebToken.encode(sub: @user.id)
        }
      } }
    else
      render json: { status: :fail, data: { errors: @user.errors } }, status: :unauthorized
    end
  end

  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
