class JwtService
  SECRET_KEY = ENV["PASS_SECRET"] || Rails.application.credentials.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    puts "should be getting here"
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    begin
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => e
      nil
    end
  end
end
