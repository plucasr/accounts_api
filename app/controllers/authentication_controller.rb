class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      payload = { user_id: user.id }
      token = JwtService.encode(payload)
      render json: { token: token }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def validate_token
    token = request.headers["Authorization"]&.split(" ")&.last

    if token
      decoded_token = JwtService.decode(token)
      if decoded_token && User.exists?(decoded_token[:user_id])
        render json: { message: "Token is valid" }, status: :ok
      else
        render json: { error: "Invalid token" }, status: :unauthorized
      end
    else
      render json: { error: "Token not provided" }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
