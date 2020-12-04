module Trivia
  class TokenService
    include HTTParty
    base_uri 'https://opentdb.com/api_token.php'

    def initialize(game)
      @game = game
      @options = { format: :plain }
    end

    def current
      token = @game.tokens.current
      return token.api_token if token

      response = fetch
      raise 'Problem during token generation' if response[:response_code] != 0

      @game.tokens.register(response[:token]).api_token
    end

    def use(api_token)
      token = @game.tokens.find_by(api_token: api_token)
      raise 'Invalid token' unless token
      raise 'This token is too old to be used' if token.expired?

      token.use
    end

    def current_fresh
      api_token = current
      response = reset(api_token)
      raise 'Problem during token refreshing' if response[:response_code] != 0

      use(api_token)
    end

    private

    def fetch
      get_json query: { command: 'request' }
    end

    def reset(api_token)
      get_json query: { command: 'reset', token: api_token }
    end

    def get_json(options = {}, uri = '')
      JSON.parse(self.class.get(uri, @options.merge(options)).response.body, symbolize_names: true)
    end
  end
end
