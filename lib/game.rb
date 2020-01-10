# frozen_string_literal: true

class Game
  attr_reader :player1, :player2, :last_action, :loser

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
    @loser = nil
    @last_action = ''
  end

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  def attack(player)
    player.receive_damage
    change_turn
    @last_action = 'attacked'
  end

  def paralyze(player)
    player.receive_paralyze
    if player.paralyzed?
      @last_action = 'paralyzed'
    else
      change_turn
      @last_action = 'tried to paralyze'
    end
  end

  def paralyzed?
    @player1.paralyzed? || @player2.paralyzed?
  end

  def turn_number
    @turn
  end

  def last_turn_player
    @turn.even? ? @player2 : @player1
  end

  def turn
    @turn.even? ? @player1 : @player2
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

  def winner
    loser == @player1 ? @player2 : @player1
  end
end
