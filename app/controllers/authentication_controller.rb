class AuthenticationController < ApiController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      render json: { status: :success, data: {
        user: {
          email: user.email,
          name: user.name,
          token: JsonWebToken.encode(sub: user.id)
        }

      } }
    else
      render json: { status: :fail, message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def fetch
    render json: current_user
  end
end
