class AddGameToToken < ActiveRecord::Migration[6.0]
  def change
    add_reference :tokens, :game, null: false, foreign_key: true
  end
end
