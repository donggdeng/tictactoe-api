class MoveResource < JSONAPI::Resource
  attributes :position, :player

  has_one :game
end
