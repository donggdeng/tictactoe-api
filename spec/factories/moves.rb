FactoryBot.define do
  factory :move do
    game
    player { 0 }
    position { 1 }
  end
end
