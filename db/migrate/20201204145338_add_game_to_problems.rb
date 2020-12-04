class AddGameToProblems < ActiveRecord::Migration[6.0]
  def change
    add_reference :problems, :game, null: false, foreign_key: true
  end
end
