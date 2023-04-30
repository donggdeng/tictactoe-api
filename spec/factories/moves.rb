FactoryBot.define do
  factory :move do
    game
    player { game.player1 }
    position { 1 }
  end
end
