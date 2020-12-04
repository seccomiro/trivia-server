class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :api_token
      t.datetime :last_used_at

      t.timestamps
    end
  end
end
