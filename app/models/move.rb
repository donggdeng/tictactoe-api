class Move < ApplicationRecord
  belongs_to :game

  after_create :update_game_progress

  enum player: { player1: 0, player2: 1 }

  validates :position, uniqueness: { scope: :game_id, message: "This position has already been taken" }
  validates :position, inclusion: { in: 1..9, message: "A valid position would be between 1 and 9" }
  validate :game_is_playing, if: :new_record?

  private

  def update_game_progress
    game.update_progress
  end

  def game_is_playing
    errors.add(:game, "is not playing") unless game.playing?
  end
end
