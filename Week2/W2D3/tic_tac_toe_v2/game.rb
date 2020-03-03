require "./board.rb"
require "./human_player.rb"
require 'Byebug'

class Game
    attr_reader :board, :current_player
    
    def initialize(*mark, num)
        @players = mark.map { |ele| HumanPlayer.new(ele) }
        @board = Board.new(num)
        @current_player = @players[0]
    end

    def switch_turn
        @current_player.rotate!
    end

    def play
        while @board.empty_positions?
            @board.print_board
            move = @current_player.get_position 
            @board.place_mark(move, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts 'Congrats you win!'
                @board.print_board
                return true
            else
                self.switch_turn
            end
        end
        puts "It's a draw"
    end
end