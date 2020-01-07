# frozen_string_literal: true

class Player
  attr_reader :name

  def initialize(name, hp = 100)
    @name = name
    @hp = hp
  end
end
