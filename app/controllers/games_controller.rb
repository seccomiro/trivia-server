class GamesController < ApiController
  before_action :authenticate_user!

  def current
    category = Category.find_by(id: params[:category_id])
    difficulty = params[:difficulty]
    @game = current_user.current_or_new_game(category, difficulty)
  end
end
