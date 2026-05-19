# frozen_string_literal: true

# Board class
class Board
  MAX_MOVES = 9

  WIN_CONDITIONS =
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ].freeze

  def initialize
    @board = [
      [false, false, false],
      [false, false, false],
      [false, false, false]
    ]

    @total_moves = 0
  end

  def show
    board.each do |row|
      row.each do |field|
        print field ? "[ #{ field } ] " : '[ - ] '
      end
      puts
    end
  end

  def play(position, player)
    row, column = position.split(',').map { |number| number.to_i - 1 }

    return false if board[row][column]

    @total_moves += 1
    board[row][column] = player.marker
  end

  def check_winner
    board = @board.flatten

    WIN_CONDITIONS.each do |line|
      return board[line[0]] if board[line[0]] && board[line[0]] == board[line[1]] && board[line[0]] == board[line[2]]
    end

    @total_moves == MAX_MOVES ? 'Draw' : -1
  end

  private

  attr_accessor :board
end
