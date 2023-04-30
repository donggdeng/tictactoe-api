class RemovePlayersFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :player1_id
    remove_column :games, :player2_id
    remove_column :games, :winner_id
    add_column :games, :winner, :integer
  end
end
