class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy
  validates :name, presence: true

  def current_game
    games.playing.last
  end

  def current_or_new_game(category = nil, difficulty = nil)
    current_game || new_game(category, difficulty)
  end

  def new_game(category = nil, difficulty = nil)
    difficulty = ['hard', 'medium', 'easy'].include?(difficulty) ? difficulty : nil
    games.create(category: category, difficulty: difficulty)
  end
end
