class RankingController < ApiController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @games = Game.includes(:user).sort_by { |g| -g.score }[0..20]
  end
end
