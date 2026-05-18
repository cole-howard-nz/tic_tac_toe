# frozen_string_literal: true

# Player class
class Player
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
    @moves = 0
  end
end
