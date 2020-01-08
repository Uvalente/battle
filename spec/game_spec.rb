require 'game'

describe Game do
let(:player1) { double(:player1) }
let(:player2) { double(:player2) }
subject { described_class.new(player1, player2) }

  describe '#player1' do
    it 'return the first player' do
      expect(subject.player1).to eq player1
    end

    it 'return the first player name' do
      allow(player1).to receive(:name) { 'Player 1' }
      expect(subject.player1.name).to eq 'Player 1'
    end
  end

  describe '#player2' do
    it 'return the first player' do
      expect(subject.player2).to eq player2
    end

    it 'return the second player name' do
      allow(player2).to receive(:name) { 'Player 2' }
      expect(subject.player2.name).to eq 'Player 2'
    end
  end

  describe '#attack' do  
    it 'should attack someone' do
      expect(player2).to receive(:receive_damage)
      subject.attack(subject.player2)
    end
  end
end
