class TriviaService
  include HTTParty
  base_uri 'https://opentdb.com/api.php'

  def initialize(category_id, difficulty)
    @options = {
      query: {
        token: api_token,
        amount: 1,
        category: category_id,
        difficulty: difficulty,
        type: 'multiple'
      }
    }
  end

  def fetch_question
    fetch
  end

  private

  def fetch
    get_json
  end

  def api_token
    TokenService.new.current
  end

  def get_json(options = {}, uri = '')
    JSON.parse(self.class.get(uri, @options.merge(options)).response.body, symbolize_names: true)
  end
end
