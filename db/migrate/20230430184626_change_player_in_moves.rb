class ChangePlayerInMoves < ActiveRecord::Migration[7.0]
  def change
    remove_column :moves, :player_id
    add_column :moves, :player, :integer
  end
end
