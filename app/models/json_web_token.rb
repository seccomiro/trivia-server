class JsonWebToken
  def self.encode(payload)
    expiration = 2.weeks.from_now.to_i
    JWT.encode payload.merge(exp: expiration), ENV['SECRET_KEY_BASE']
  end

  def self.decode(token)
    JWT.decode(token, ENV['SECRET_KEY_BASE']).first
  end
end
