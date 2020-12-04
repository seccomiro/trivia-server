class Game < ApplicationRecord
  has_many :problems, dependent: :destroy
  has_many :tokens, dependent: :destroy
  belongs_to :user
  belongs_to :category, optional: true
  enum status: [:playing, :finished]
  before_create :ensure_status

  def score
    problems.reduce(0) { |total, problem| total + problem.score }
  end

  private

  def ensure_status
    self.status = :playing
  end
end
