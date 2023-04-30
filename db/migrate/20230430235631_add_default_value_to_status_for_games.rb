class AddDefaultValueToStatusForGames < ActiveRecord::Migration[7.0]
  def change
    change_column :games, :status, :integer, default: 0
  end
end
