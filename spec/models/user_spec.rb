require "rails_helper"

RSpec.describe User, type: :model do
  it "is not valid without a name" do
    user = build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it "is valid with a name" do
    user = build(:user)
    expect(user).to be_valid
  end

  describe '#games' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }

    let!(:game1) { create(:game, player1: user1, player2: user2) }
    let!(:game2) { create(:game, player1: user2, player2: user1) }
    let!(:other_game) { create(:game, player1: user3, player2: user2) }

    it 'returns all games where the user is a player' do
      expect(user1.games).to eq([game1, game2])
    end
  end
end
