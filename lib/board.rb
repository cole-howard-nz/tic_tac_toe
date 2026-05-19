# frozen_string_literal: true

# Board class
class Board
  WIN_CONDITIONS =
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ].freeze

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

  def check_winner
    board = @board.flatten

    WIN_CONDITIONS.each do |line|
      return board[line[0]] if board[line[0]] && board[line[0]] == board[line[1]] && board[line[0]] == board[line[2]]
    end

    -1
  end

  private

  attr_accessor :board
end
