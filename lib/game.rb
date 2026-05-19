# frozen_string_literal: true

require_relative 'board'

# Game class
class Game
  TOTAL_PLAYERS = 2
  PLAYER_MARKERS = (%w[X O] + (('A'..'Z').to_a - %w[X O])).freeze

  def initialize
    @winner = -1
    @players = []
    @board = Board.new

    setup_players
    play

    puts "\n#{ winner } has won the game!\n\n"
    @board.show
  end

  private

  attr_accessor :players, :winner

  def play
    turn = players.index('X')
    puts 'Marker X begins the game..'
    while winner.eql?(-1)
      sleep 1
      @board.show

      valid = false
      valid = @board.play(ask_for_position(players[turn]), players[turn]) until valid

      @winner = @board.check_winner

      turn = (turn + 1) % TOTAL_PLAYERS
    end
  end

  def ask_for_position(marker)
    position = ''
    width = @board.width
    until position.match(/^[1-#{ width }],[1-#{ width }]$/)
      print "Marker #{ marker } enter a comma seperated position: "
      position = gets.chomp
    end
    position
  end

  def setup_players
    TOTAL_PLAYERS.times do |index|
      input = ''
      until PLAYER_MARKERS[0..(TOTAL_PLAYERS - 1)].include? input.upcase
        print "Enter player #{ index + 1 }'s marker (#{ PLAYER_MARKERS[0..(TOTAL_PLAYERS - 1)].join(', ') }): "
        input = gets.chomp
      end

      players.push input.upcase
    end
  end
end
