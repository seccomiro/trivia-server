class RoutesController < ApiController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @routes = [
      {
        description: 'Categories',
        method: :get,
        url: categories_url
      },
      {
        description: 'Ranking',
        method: :get,
        url: ranking_url
      },
      {
        description: 'Register new user',
        method: :post,
        url: user_registration_url
      },
      {
        description: 'Login user',
        method: :post,
        url: auth_url
      },
      {
        description: 'Get current game or create a new one',
        method: :get,
        url: current_games_url
      },
      {
        description: 'Finish current',
        method: :delete,
        url: finish_games_url
      },
      {
        description: 'Get next problem',
        method: :get,
        url: next_problems_url
      },
      {
        description: 'View current problem',
        method: :get,
        url: view_problems_url
      },
      {
        description: 'Answer current problem',
        method: :post,
        url: answer_problems_url
      }
    ]
  end
end
