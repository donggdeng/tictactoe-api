class GameResource < JSONAPI::Resource
  attributes :status

  has_one :player1, class_name: 'User', foreign_key: :player1_id
  # has_one :player2, class_name: 'User', foreign_key: :player2_id
  # has_one :winner, class_name: 'User', foreign_key: :winner_id
end
