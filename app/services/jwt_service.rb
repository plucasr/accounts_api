class JwtService
  SECRET_KEY = Rails.application.secrets.secret_key_base # Or a more secure secret

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    begin
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => e
      nil # Or handle the error as needed
    end
  end
end
