require 'player'

describe Player do
  subject { described_class.new('Player 1') }
  it 'should return the name of the player' do
    expect(subject.name).to eq('Player 1')
  end
end