class Token < ApplicationRecord
  belongs_to :game

  def use
    self.last_used_at = DateTime.now
    save
    api_token
  end

  def self.register(api_token)
    Token.create(api_token: api_token, last_used_at: DateTime.now)
  end

  def self.current
    token = Token.last
    token if token && !token.expired?
  end

  def expired?
    last_used_at <= 5.hours.ago
  end
end
