# frozen_string_literal: true

require 'game'

describe Game do
  let(:player1) { double(:player1, name: 'Player 1') }
  let(:player2) { double(:player2, name: 'Player 2') }
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
    it 'return the second player' do
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

  describe '#turn' do
    it 'first turn is player 1' do
      expect(subject.turn).to eq 'Player 1'
    end

    it 'second turn is for player 2' do
      subject.change_turn
      expect(subject.turn).to eq 'Player 2'
    end

    it 'third turn is for player 1' do
      2.times { subject.change_turn }
      expect(subject.turn).to eq 'Player 1'
    end
  end

  describe '#game_over' do
    it 'return false if no player is dead' do
      allow(player1).to receive(:hp) { 10 }
      allow(player2).to receive(:hp) { 10 }
      expect(subject.game_over?).to be false
    end

    it 'return true if player 1 is dead' do
      allow(player1).to receive(:hp) { 0 }
      allow(player2).to receive(:hp) { 10 }
      expect(subject.game_over?).to be true
    end

    it 'return true if player 2 is dead' do
      allow(player1).to receive(:hp) { 10 }
      allow(player2).to receive(:hp) { 0 }
      expect(subject.game_over?).to be true
    end
  end

  describe '#loser' do
    it 'return player 1 as loser' do
      allow(player1).to receive(:hp) { 0 }
      allow(player2).to receive(:hp) { 10 }
      subject.game_over?
      expect(subject.loser).to eq player1
    end

    it 'return player 2 as loser' do
      allow(player1).to receive(:hp) { 10 }
      allow(player2).to receive(:hp) { 0 }
      subject.game_over?
      expect(subject.loser).to eq player2
    end
  end

  describe '#winner' do
    it 'return player 1 as winner' do
      allow(player1).to receive(:hp) { 10 }
      allow(player2).to receive(:hp) { 0 }
      subject.game_over?
      expect(subject.winner).to eq player1
    end

    it 'return player 1 as winner' do
      allow(player1).to receive(:hp) { 0 }
      allow(player2).to receive(:hp) { 10 }
      subject.game_over?
      expect(subject.winner).to eq player2
    end
  end
end
