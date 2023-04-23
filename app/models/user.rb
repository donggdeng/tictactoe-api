class User < ApplicationRecord
  has_many :games_as_player1, class_name: 'Game', foreign_key: 'player1_id'
  has_many :games_as_player2, class_name: 'Game', foreign_key: 'player2_id'
  has_many :games_as_winner, class_name: 'Game', foreign_key: 'winner_id'

  validates_presence_of :name

  def games
    Game.where("player1_id = ? OR player2_id = ?", self.id, self.id)
  end
end
