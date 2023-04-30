class ChangeRowAndColumnToPositionInMoves < ActiveRecord::Migration[7.0]
  def change
    remove_column :moves, :row
    remove_column :moves, :column
    add_column :moves, :position, :integer
  end
end
