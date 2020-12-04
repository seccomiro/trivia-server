class AddParamsToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :category, null: true, foreign_key: true
    add_column :games, :difficulty, :string
  end
end
