require "./board.rb"
require "./human_player.rb"
require 'Byebug'

class Game
    attr_reader :board, :current_player
    
    def initialize(mark_1, mark_2)
        @player_1 = HumanPlayer.new(mark_1)
        @player_2 = HumanPlayer.new(mark_2)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1 
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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