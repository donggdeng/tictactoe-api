class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :player_id, null: false
      t.integer :row
      t.integer :column

      t.timestamps
    end
  end
end
