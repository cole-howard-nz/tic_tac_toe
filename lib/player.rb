# frozen_string_literal: true

# Player class
class Player
  def initialize(marker)
    @marker = marker
    @moves = 0
  end

  private

  attr_accessor :marker
end
