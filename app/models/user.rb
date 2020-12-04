class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy

  def current_game
    games.playing.last
  end

  def new_game
    games.create
  end
end
