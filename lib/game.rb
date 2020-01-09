# frozen_string_literal: true

class Game
  attr_reader :player1, :player2

  def initialize(player1 = Player.new('Player 1'), player2 = Player.new('Player 2'))
    @player1 = player1
    @player2 = player2
    @turn = 0
  end

  def attack(player)
    player.receive_damage
    change_turn
  end

  def turn_number
    @turn
  end

  def turn
    @turn.even? ? @player1.name : @player2.name
  end

  def change_turn
    @turn += 1
  end
end
