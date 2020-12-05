class GamesController < ApiController
  before_action :authenticate_user!

  def current
    category = Category.find_by(id: params[:category_id])
    difficulty = params[:difficulty]
    @game = current_user.current_or_new_game(category, difficulty)
  end

  def score
    @game = current_user.current_game

    error = 'You are not playing a game' unless @game
    return render_error(error) if error

    render :current
  end

  def finish
    @game = current_user.current_game

    error = 'You are not playing a game' unless @game
    return render_error(error) if error

    @game.finish
  end
end
