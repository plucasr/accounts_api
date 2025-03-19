class ApplicationController < ActionController::API
  private
  def authenticate_request
    token = request.headers["Authorization"]&.split(" ")&.last

    if token
      decoded_token = JwtService.decode(token)
      if decoded_token && User.exists?(decoded_token[:user_id])
        @current_user = User.find(decoded_token[:user_id])
      else
        render json: { error: "Invalid token" }, status: :unauthorized
      end
    else
      render json: { error: "Token not provided" }, status: :unauthorized
    end
  end
end
