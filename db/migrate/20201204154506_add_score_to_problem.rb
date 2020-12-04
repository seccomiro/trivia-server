class AddScoreToProblem < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :score, :integer, default: 0
  end
end
