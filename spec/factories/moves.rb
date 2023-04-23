FactoryBot.define do
  factory :move do
    game
    player { game.player1 }
    row { 1 }
    column { 1 }
  end
end
