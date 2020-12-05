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

  def current_problem
    problems.last unless problems.last&.answered?
  end

  def finish
    self.status = :finished
    self.finished_at = DateTime.now
    save
  end

  private

  def ensure_status
    self.status = :playing
  end
end
