# frozen_string_literal: true

class Game
  attr_reader :player1, :player2

  def initialize(player1 = Player.new('Player 1'), player2 = Player.new('Player 2'))
    @player1 = player1
    @player2 = player2
    @turn = 0
    @loser = nil
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

  def game_over?
    dead?(@player1)
    dead?(@player2)
    !!@loser
  end

  def dead?(player)
    @loser = player if player.hp <= 0
  end

  def loser
    @loser
  end

  def winner
    loser == @player1 ? @player2 : @player1
  end
end
