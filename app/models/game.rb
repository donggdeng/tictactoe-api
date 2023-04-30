class Game < ApplicationRecord
  has_many :moves

  enum status: { waiting: 0, playing: 1, finished: 2 }
  enum winner: { player1: 0, player2: 1, draw: 2 }
end
