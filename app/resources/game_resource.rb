class GameResource < JSONAPI::Resource
  attributes :status, :player1, :player2, :winner

  def player1
    @model.player1.name
  end

  def player2
    @model.player2.name
  end

  def winner
    @model.winner&.name
  end
end
