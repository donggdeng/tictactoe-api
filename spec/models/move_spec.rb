require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:game) { create(:game) }

  describe "validations" do
    subject { move }

    context "when position is between 1 and 9" do
      let(:move) { build(:move, game: game, player: :player1, position: 5) }

      it "is valid" do
        expect(move).to be_valid
      end
    end

    context "when position is already taken" do
      let!(:previous_move) { create(:move, game: game, player: :player1, position: 5) }
      let(:move) { build(:move, game: game, player: :player2, position: 5) }

      it "is invalid" do
        expect(move).not_to be_valid
        expect(move.errors.full_messages).to include("Position This position has already been taken")
      end
    end

    context "when position is less than 1" do
      let(:move) { build(:move, game: game, player: :player1, position: 0) }

      it "is invalid" do
        expect(move).not_to be_valid
        expect(move.errors.full_messages).to include("Position A valid position would be between 1 and 9")
      end
    end

    context "when position is greater than 9" do
      let(:move) { build(:move, game: game, player: :player1, position: 10) }

      it "is invalid" do
        expect(move).not_to be_valid
        expect(move.errors.full_messages).to include("Position A valid position would be between 1 and 9")
      end
    end

    context "when game is not playing" do
      before do
        create(:move, game: game, player: :player1, position: 1)
        create(:move, game: game, player: :player2, position: 2)
        create(:move, game: game, player: :player1, position: 5)
        create(:move, game: game, player: :player2, position: 3)
        create(:move, game: game, player: :player1, position: 9)
      end

      let(:move) { build(:move, game: game, player: :player2, position: 8) }

      it "is invalid" do
        expect(move).not_to be_valid
        expect(move.errors.full_messages).to include("Game is not playing")
      end
    end
  end
end
