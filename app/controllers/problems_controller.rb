class ProblemsController < ApiController
  before_action :authenticate_user!
  before_action :set_game

  def next
    @problem = Trivia::QuestionService.new(@game).fetch
  end

  private

  def set_game
    @game = current_user.current_game
  end
end
