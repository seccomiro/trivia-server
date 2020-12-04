class AddSelectedToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :selected, :boolean, default: false
    add_column :answers, :answered_at, :datetime
  end
end
