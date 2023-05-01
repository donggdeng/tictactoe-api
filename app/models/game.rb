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

    winning_positions.each do |positions|
      if positions.all? { |position| moves.where(position: position).player1.any? }
        return :player1
      elsif positions.all? { |position| moves.where(position: position).player2.any? }
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
