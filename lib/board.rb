# frozen_string_literal: true

# Board class
class Board
  attr_accessor :board
  attr_reader :width

  def initialize
    @board = [
      [false, false, false],
      [false, false, false],
      [false, false, false]
    ]

    @width = @board[0].length
  end

  def show
    board.each do |row|
      row.each do |field|
        if %w[X O].include?(field)
          print "[ #{ field } ] "
        else
          print '[ - ] '
        end
      end
      puts
    end
  end

  def play(position, marker)
    row, column = position.split(',').map { |number| number.to_i - 1 }

    return false if board[row][column]

    board[row][column] = marker
  end
end
