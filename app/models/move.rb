class Move < ApplicationRecord
  belongs_to :game
  belongs_to :player, class_name: 'User', foreign_key: 'player_id'

  validates :position, uniqueness: { scope: :game_id, message: "This position has already been taken" }
  validates :position, inclusion: { in: 1..9, message: "A valid position would be between 1 and 9" }
end
