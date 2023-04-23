class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.integer :winner_id
      t.integer :status

      t.timestamps
    end
  end
end
