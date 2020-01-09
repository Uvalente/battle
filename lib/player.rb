# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :hp

  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def receive_damage
    @hp -= random_damage
  end

  def random_damage
    Kernel.rand(1..10)
  end
end
