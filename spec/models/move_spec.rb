require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:player1) { create(:user, name: "Player 1") }
  let(:player2) { create(:user, name: "Player 2") }
  let(:game) { create(:game, player1: player1, player2: player2) }

  describe "validations" do
    subject { move }

    context "when position is between 1 and 9" do
      let(:move) { build(:move, game: game, player: player1, position: 5) }

      it "is valid" do
        expect(move).to be_valid
      end
    end

    context "when position is already taken" do
      let!(:previous_move) { create(:move, game: game, player: player1, position: 5) }
      let(:move) { build(:move, game: game, player: player2, position: 5) }

      it "is invalid" do
        expect(move).not_to be_valid
        expect(move.errors.full_messages).to include("Position This position has already been taken")
      end
    end

    context "when position is less than 1" do
      let(:move) { build(:move, game: game, player: player1, position: 0) }

      it "is invalid" do
        expect(move).not_to be_valid
        expect(move.errors.full_messages).to include("Position A valid position would be between 1 and 9")
      end
    end

    context "when position is greater than 9" do
      let(:move) { build(:move, game: game, player: player1, position: 10) }

      it "is invalid" do
        expect(move).not_to be_valid
        expect(move.errors.full_messages).to include("Position A valid position would be between 1 and 9")
      end
    end
  end
end
