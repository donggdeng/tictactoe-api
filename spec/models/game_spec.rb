require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { create(:game) }

  describe "#update_progress" do
    context "when player 1 wins the game" do
      it "updates the game status and winner if there is one" do
        expect(game.status).to eq("playing")

        create(:move, game: game, player: :player1, position: 1)
        create(:move, game: game, player: :player2, position: 5)
        create(:move, game: game, player: :player1, position: 2)
        create(:move, game: game, player: :player2, position: 6)
        create(:move, game: game, player: :player1, position: 3)

        expect(game.status).to eq("finished")
        expect(game.winner).to eq("player1")
      end
    end

    context "when the game ends in a draw" do
      it "updates the game status and winner if there is one" do
        expect(game.status).to eq("playing")

        create(:move, game: game, player: :player1, position: 6)
        create(:move, game: game, player: :player2, position: 3)
        create(:move, game: game, player: :player1, position: 2)
        create(:move, game: game, player: :player2, position: 5)
        create(:move, game: game, player: :player1, position: 4)
        create(:move, game: game, player: :player2, position: 1)
        create(:move, game: game, player: :player1, position: 7)
        create(:move, game: game, player: :player2, position: 8)
        create(:move, game: game, player: :player1, position: 9)

        expect(game.status).to eq("finished")
        expect(game.winner).to eq("draw")
      end
    end
  end

  describe "#check_winner" do
    subject { game.winner }

    context "when player 1 wins with a diagonal line" do
      before do
        create(:move, game: game, player: :player1, position: 1)
        create(:move, game: game, player: :player2, position: 2)
        create(:move, game: game, player: :player1, position: 5)
        create(:move, game: game, player: :player2, position: 3)
        create(:move, game: game, player: :player1, position: 9)
      end

      it { is_expected.to eq("player1") }
    end

    context "when player 2 wins with a horizontal line" do
      before do
        create(:move, game: game, player: :player1, position: 1)
        create(:move, game: game, player: :player2, position: 4)
        create(:move, game: game, player: :player1, position: 2)
        create(:move, game: game, player: :player2, position: 5)
        create(:move, game: game, player: :player1, position: 8)
        create(:move, game: game, player: :player2, position: 6)
      end

      it { is_expected.to eq("player2") }
    end

    context "when there is no winner yet" do
      before do
        create(:move, game: game, player: :player1, position: 1)
        create(:move, game: game, player: :player2, position: 2)
      end

      it { is_expected.to be_nil }
    end
  end
end
