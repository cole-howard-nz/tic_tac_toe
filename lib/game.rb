# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Game class
class Game
  TOTAL_PLAYERS = 2
  PLAYER_MARKERS = %w[X O].freeze

  def initialize
    @turn = nil
    @winner = -1
    @players = []
    @board = Board.new

    start
  end

  private

  attr_accessor :players, :winner, :turn

  def start
    setup_players
    play

    statement = winner == 'Draw' ? "#{ winner }, nobody won.." : "#{ winner } has won the game!"
    puts "\n#{ statement }\n\n"
    @board.show
  end

  def play
    @turn = players.find_index { |player| player.marker == 'X' }

    puts 'Marker X begins the game..'
    while winner.eql?(-1)
      sleep 1
      @board.show

      take_turn

      @winner = @board.check_winner
    end
  end

  def take_turn
    valid = false
    valid = @board.play(ask_for_position(players[turn]), players[turn]) until valid

    @turn = (turn + 1) % TOTAL_PLAYERS
  end

  def ask_for_position(player)
    position = ''
    until position.match(/^[1-3],[1-3]$/)
      print "Marker #{ player.marker } enter a comma separated position: "
      position = gets.chomp
    end
    position
  end

  def setup_players
    TOTAL_PLAYERS.times do |index|
      input = ''
      until PLAYER_MARKERS.include? input.upcase
        print "Enter player #{ index + 1 }'s marker (#{ PLAYER_MARKERS.join(', ') }): "
        input = gets.chomp.upcase
      end

      players.push(Player.new(input))
    end
  end
end
