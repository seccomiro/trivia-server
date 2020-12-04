class Answer < ApplicationRecord
  belongs_to :problem

  def answer
    unanswer

    self.selected = true
    self.answered_at = DateTime.now
    save
    problem.calculate_score
  end

  def self.correct
    find_by(correct: true)
  end

  def self.selected
    find_by(selected: true)
  end

  private

  def unanswer
    a = problem.answers.selected
    return unless a

    a.selected = false
    a.answered_at = nil
    a.save
  end
end
