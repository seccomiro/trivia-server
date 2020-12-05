class GamesController < ApiController
  def current
    category = Category.find_by(id: params[:category_id])
    difficulty = params[:difficulty]

    if current_user.current_game
      @game = current_user.current_game
      @creation = :existing_game
    else
      @game = current_user.new_game(category, difficulty)
      @creation = :new_game
    end
    # @game = current_user.current_or_new_game(category, difficulty)
  end

  def finish
    @game = current_user.current_game

    error = 'You are not playing a game' unless @game
    return render_error(error) if error

    @game.finish
  end
end
