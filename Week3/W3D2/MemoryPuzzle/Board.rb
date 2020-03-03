require_relative "Card.rb"
require_relative "Game.rb"
class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(4) { Array.new(4) }
        # @grid = self.populate
    end
    
    def populate
        populate = (1..8).to_a + (1..8).to_a #[1, 1, 2, 2, 3, 3, 4....8]
        (0...@grid.length).each do |i|
          (0...@grid.length).each do |j|
            x = populate.shuffle!.shift
            @grid[i][j] = Card.new(x, false)
          end
        end
        @grid
    end

    def render
        @grid.each do |array|
            array.each do |ele|
                if ele.directions == true
                    print " #{ele.face_value} "
                else 
                    print " _ "
                end
            end
            puts ""
        end
    end

    def reveal(position)
        row, col = position 
        instance = @grid[row][col]
        instance.directions = true
        instance.face_value 
    end

    def won?
        @grid.flatten.all? {|arr| arr.directions == true}
    end
end

