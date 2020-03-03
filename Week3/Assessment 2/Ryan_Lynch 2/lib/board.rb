require 'byebug'

class Board
    #attr_reader :stacks

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.

    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(n)
        new_array = Array.new(n) { Array.new ([]) }
    end

    def initialize(stacks, max_height)
        @max_height = max_height
        @stacks = Array.new(stacks) { Array.new([]) }
        if stacks < 4 || max_height < 4 
            raise "rows and cols must be >= 4"
        else
            Board.build_stacks(stacks)
        end
    end

    def max_height 
        @max_height
    end

    def add(token, index)
        if @stacks[index].length < @max_height
            @stacks[index] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
            count = 0 
            stack.each do |ele|
                count += 1 if ele == token
            end
            if count == @max_height
                return true
            end
        end
        false
    end
    #debugger
    def horizontal_winner?(token)   
        #debugger
        (0...@max_height).each do |i|
            count = 0
            (0...@stacks.length).each do |j|
                if @stacks[j][i] == token
                    count += 1
                end
            end
            if count == @stacks.length
                return true
            end
        end
        return false
    end

    def winner?(token)
        return true if horizontal_winner?(token) || vertical_winner?(token)
        false
    end
end
