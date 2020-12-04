module Trivia
  class CategoryService
    include HTTParty
    base_uri 'https://opentdb.com/api_category.php'

    def initialize
      @options = {}
    end

    def fetch
      fetch_api[:trivia_categories]
    end

    def load_categories
      fetch.each do |c|
        Category.find_by(code: c[:id]) || Category.create(name: c[:name], code: c[:id])
      end
    end

    private

    def fetch_api
      get_json
    end

    def get_json(options = {}, uri = '')
      JSON.parse(self.class.get(uri, @options.merge(options)).response.body, symbolize_names: true)
    end
  end
end
