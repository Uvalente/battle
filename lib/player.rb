# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :hp

  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = hp
    @paralyzed = false
  end

  def receive_damage
    @hp -= random_damage
  end

  def receive_paralyze
    @hp -= small_damage
    paralyze
  end

  def random_damage
    Kernel.rand(4..10)
  end

  def small_damage
    Kernel.rand(1..4)
  end

  def paralyze
    Kernel.rand(1..4) == 1 ? @paralyzed = true : @paralyzed = false
  end

  def paralyzed?
    @paralyzed
  end
end
