class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.references :category, null: false, foreign_key: true
      t.string :difficulty
      t.string :question

      t.timestamps
    end
  end
end
