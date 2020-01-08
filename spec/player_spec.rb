require 'player'

describe Player do
  subject(:player1) { described_class.new('Player 1') }
  subject(:player2) { described_class.new('Player 2') }

  it 'should return the name of the player' do
    expect(player1.name).to eq('Player 1')
  end

  it 'return the HP' do
    expect(player1.hp).to eq Player::DEFAULT_HP
  end

  it 'reduces the HP' do
    expect { player1.receive_damage }.to change { player1.hp }.by(-10)
  end
end
