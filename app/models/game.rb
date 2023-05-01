class Game < ApplicationRecord
  has_many :moves

  enum status: { playing: 0, finished: 1 }
  enum winner: { player1: 0, player2: 1, draw: 2 }

  def next_player
    moves.count.even? ? :player1 : :player2
  end

  def update_progress
    self.winner = check_winner
    self.status = :finished if winner.present?
    self.save
  end

  def check_winner
    winning_positions = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontal
      [1, 4, 7], [2, 5, 8], [3, 6, 9], # vertical
      [1, 5, 9], [3, 5, 7]             # diagonal
    ]

    player1_positions = moves.player1.pluck(:position)
    player2_positions = moves.player2.pluck(:position)

    winning_positions.each do |positions|
      if positions.subarray?(player1_positions)
        return :player1
      elsif positions.subarray?(player2_positions)
        return :player2
      end
    end

    if moves.count == 9
      :draw
    else
      nil
    end
  end
end
