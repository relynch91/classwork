require 'Byebug'

class Board
    attr_reader :board, :number
    
    def initialize(n) 
        @number = n
        @board = Array.new(n) { Array.new(n, "_")}
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end

    def []=(pos, mark)
        @board[pos[0]][pos[1]] = mark
    end

    def valid?(pos) # as an array ie [1, 2]
        (pos[0] < @board.length && pos[0] >= 0) && (pos[1] < @board.length && pos[1] >= 0)
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        if empty?(pos) && valid?(pos)
            self[pos] = mark
        else
            raise "Invalid position, try again"
        end
    end

    def print_board
        # debugger
        @board.each do |row|
            (0...row.length).each do |i|
                print " #{row[i]}"
            end
            puts
        end
    end

    def win_row?(mark)
        @board.each do |row|
            return true if row.all? {|ele| ele == mark}
        end
        false
    end

    def win_col?(mark)
        (0...@board.length).each do |i| 
            col = Array.new
            (0...@board.length).each do |j|
                pos = [j, i]
                col << self[pos]
            end
            return true if col.uniq == [mark]
        end
        false
    end

    def win_diagonal?(mark)
        left_right = Array.new
        right_left = Array.new
        # debugger
        (0...@board.length).each do |i| 
            x = @board.length - 1 - i
            pos_1 = [x, i]
            pos_2 = [i, i]

            right_left << self[pos_1] #@board[x][i]
            left_right << self[pos_2]
        end
    
        return true if left_right.uniq == [mark] || right_left.uniq == [mark]
        false
    end

    def win?(mark)
        return true if win_row?(mark)
        return true if win_col?(mark)
        return true if win_diagonal?(mark)
        false 
    end
    
    def empty_positions?
        return true if @board.flatten.count("_") > 0
        false
    end


end