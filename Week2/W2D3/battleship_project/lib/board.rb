require 'byebug'

class Board
    attr_reader :size, :num

    def initialize(num)
        @grid = Array.new(num){Array.new(num, :N) }
        @size = num * num
        @num = num
    end

    def [](array)
        x = array[0]
        y = array[1]
        @grid[x][y]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |row|
            count += row.count(:S)
        end
        count
    end

    def attack(position)#position = [2, 4]
        if self[position] == :S
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        quarter = size / 4
        while num_ships < quarter
            x = rand(0...num)
            y = rand(0...num)
            self[[x,y]] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(num){Array.new(num) }
    
        (0...hidden_grid.length).each do |i|
            (0...hidden_grid.length).each do |j|
                position = [i,j]
                if self[position] == :S
                    hidden_grid[i][j] = :N
                else
                    hidden_grid[i][j] = self[position]
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each do |row| #each row of grid [ :N, :N, :X]
            (0...row.length).each do |i| # each element of row 
                if i == 0
                    print "#{row[i]}"
                else
                    print " #{row[i]}"
                end
            end
            puts
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
