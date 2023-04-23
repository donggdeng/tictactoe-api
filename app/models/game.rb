class Game < ApplicationRecord
  belongs_to :player1, class_name: 'User', foreign_key: 'player1_id'
  belongs_to :player2, class_name: 'User', foreign_key: 'player2_id'
  belongs_to :winner, class_name: 'User', foreign_key: 'winner_id', optional: true

  enum status: { waiting: 0, playing: 1, finished: 2 }
end
