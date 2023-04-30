class GameResource < JSONAPI::Resource
  attributes :status, :winner

  has_many :moves
end
