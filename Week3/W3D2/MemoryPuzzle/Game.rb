require_relative "Card.rb"
require_relative "Board.rb"

class Game
    attr_accessor :compare, :board, :previous_guess
    def initialize
        @previous_guess = nil
        @board = Board.new
        @compare = false
    end

    def prompt
        puts "inputs a guess "
        inputs = gets.chomp.split("").map(&:to_i)
    end
        
    def play
        while !@board.won?
            # system("clear")
            # sleep(1)
            @board.render
            guess = self.prompt
            self.guessed_pos(guess)
        end
    end

    def guessed_pos(position) #position = [0, 0]
        row, col = position 
        card = @board.grid[row][col]
        if @compare == false
            @previous_guess = card #card is an instance variable
            @previous_guess.directions = true
            @compare = true
        elsif card == @previous_guess
            @previous_guess = nil
            card.directions = true
            @compare = false
        else
            card.directions = false
            @previous_guess.directions = false
            @compare = false
            @previous_guess = nil
        end
        system("clear")
            sleep(1)
    end
end