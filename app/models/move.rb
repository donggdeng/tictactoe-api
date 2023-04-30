class Move < ApplicationRecord
  belongs_to :game

  enum player: { player1: 0, player2: 1 }

  validates :position, uniqueness: { scope: :game_id, message: "This position has already been taken" }
  validates :position, inclusion: { in: 1..9, message: "A valid position would be between 1 and 9" }
end
