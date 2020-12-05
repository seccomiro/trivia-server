class ProblemsController < ApiController
  before_action :authenticate_user!
  before_action :set_game

  def next
    error = 'You have an open problem to answer first' if @game.current_problem
    return render_error(error) if error

    @problem = Trivia::QuestionService.new(@game).fetch
    render :view
  end

  def view
    error = 'You need to ask for a new question' unless @game.current_problem
    return render_error(error) if error

    @problem = @game.current_problem
  end

  def answer
    error = 'Invalid answer' unless ['1', '2', '3', '4'].include?(params[:answer])
    error = 'You need to ask for a new question' unless @game.current_problem

    return render_error(error) if error

    @problem = @game.current_problem
    @problem.answer(params[:answer])
  end

  private

  def set_game
    @game = current_user.current_game
  end

  def render_error(error)
    render json: { status: :fail, message: error }, status: :bad_request
  end
end
