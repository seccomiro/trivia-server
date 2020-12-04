module Trivia
  class QuestionService
    include HTTParty
    base_uri 'https://opentdb.com/api.php'

    def initialize(game, category = nil, difficulty = nil)
      @category = category
      @game = game
      @options = {
        query: {
          amount: 1,
          difficulty: difficulty,
          type: 'multiple'
        }
      }
    end

    def fetch
      response = fetch_api
      if response[:results].empty?
        Trivia::TokenService.new(@game).current_fresh
        response = fetch_api
      end
      payload = response[:results].first
      Problem.generate(@game, payload)
      @game.reload
    end

    private

    def fetch_api
      category = Category.where(id: @category_id).first
      get_json({ category: category&.code, token: api_token })
    end

    def api_token
      Trivia::TokenService.new(@game).current
    end

    def get_json(options = {}, uri = '')
      JSON.parse(self.class.get(uri, @options.merge(options)).response.body, symbolize_names: true)
    end
  end
end
