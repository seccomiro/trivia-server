class AddUserToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :user, null: false, foreign_key: true
  end
end
