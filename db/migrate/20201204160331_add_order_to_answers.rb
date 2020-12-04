class AddOrderToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :order, :integer
  end
end
