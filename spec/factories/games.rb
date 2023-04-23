FactoryBot.define do
  factory :game do
    association :player1, factory: :user
    association :player2, factory: :user
    status { 0 }
  end
end
