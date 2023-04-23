require 'rails_helper'

RSpec.describe Move, type: :model do
  subject { build(:move, row: row, column: column) }

  context 'when row is not between 1 and 3' do
    let(:row) { 0 }
    let(:column) { 2 }

    it 'is invalid' do
      expect(subject).not_to be_valid
      expect(subject.errors[:row]).to include("A valid row number would be 1, 2 or 3")
    end
  end

  context 'when column is not between 1 and 3' do
    let(:row) { 2 }
    let(:column) { 4 }

    it 'is invalid' do
      expect(subject).not_to be_valid
      expect(subject.errors[:column]).to include("A valid column number would be 1, 2 or 3")
    end
  end

  context 'when row and column are between 1 and 3' do
    let(:row) { 2 }
    let(:column) { 3 }

    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
