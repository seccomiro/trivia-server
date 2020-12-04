class Game < ApplicationRecord
  has_many :problems, dependent: :destroy
  has_many :tokens, dependent: :destroy

  def score
    problems.reduce(0) { |total, problem| total + problem.score }
  end
end
