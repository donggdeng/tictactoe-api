class Game < ApplicationRecord
  has_many :moves

  enum status: { playing: 0, finished: 1 }
  enum winner: { player1: 0, player2: 1, draw: 2 }

  def next_player
    moves.count.even? ? :player1 : :player2
  end
end
