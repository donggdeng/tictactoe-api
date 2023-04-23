class Move < ApplicationRecord
  belongs_to :game
  belongs_to :player, class_name: 'User', foreign_key: 'player_id'

  validates :row, inclusion: { in: 1..3, message: "A valid row number would be 1, 2 or 3" }
  validates :column, inclusion: { in: 1..3, message: "A valid column number would be 1, 2 or 3" }
end
