class Problem < ApplicationRecord
  belongs_to :category
  belongs_to :game
  has_many :answers, dependent: :destroy

  def self.generate(game, payload)
    category = Category.find_by(name: payload[:category])
    problem = game.problems.create(
      difficulty: payload[:difficulty],
      question: payload[:question],
      category: category
    )
    generate_answers(problem, payload[:correct_answer], payload[:incorrect_answers])
    problem
  end

  def answered?
    !answers.selected.nil?
  end

  def status
    return :unanswered unless answered?
    return :correct if answers.selected == answers.correct

    :incorrect
  end

  def calculate_score
    scores = { 'hard' => 10, 'medium' => 8, 'easy' => 5 }
    self.score = scores[difficulty] * (case status
                                       when :correct
                                         1
                                       when :incorrect
                                         -1
                                       else
                                         0
                                       end)
    save
  end

  def answer(order)
    answers.find_by(order: order).answer
  end

  def self.generate_answers(problem, correct, incorrect)
    answers = [{
      description: correct,
      correct: true
    }] + incorrect.map do |a|
           {
             description: a,
             correct: false
           }
         end
    answers.shuffle!

    answers.each_with_index do |a, i|
      problem.answers.create(description: a[:description], correct: a[:correct], order: i + 1)
    end
  end
end
