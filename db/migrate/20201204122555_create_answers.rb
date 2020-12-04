class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :problem, null: false, foreign_key: true
      t.string :description
      t.boolean :correct

      t.timestamps
    end
  end
end
