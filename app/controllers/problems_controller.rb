class ProblemsController < ApiController
  before_action :authenticate_user!
  before_action :set_game

  def next
    @problem = Trivia::QuestionService.new(@game).fetch
  end

  def answer
    unless @game.current_problem
      return render json: {
        status: :fail, message: 'You need to ask for a new question'
      }, status: :bad_request
    end

    @problem = @game.current_problem
    @problem.answer(params[:answer])
  end

  private

  def set_game
    @game = current_user.current_game
  end
end
