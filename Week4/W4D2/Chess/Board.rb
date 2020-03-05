require_relative 'NullPiece.rb'
require_relative "Knight"
require_relative "Bishop.rb"
require_relative "King.rb"
require_relative "Pawn.rb"
require_relative "Queen.rb"
require_relative "Rook.rb"


class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) {Array.new(8)}
    build_board
  end

  def build_board
    (0...@board.length).each do |i|
          (0...@board.length).each do |j|
            pos = [i, j]
            case pos
            when ([0, 0] || [0, 7])
              @board[i][j] = Rook.new(pos, @board, "black")
            when [0, 1] || [0, 6]
              @board[i][j] = Knight.new(pos, @board, "black")
            when [0, 2] || [0, 5]
              @board[i][j] = Bishop.new(pos, @board, "black")
            when [0, 3]
              @board[i][j] = Queen.new(pos, @board, "black")
            when [0, 4]
              @board[i][j] = King.new(pos, @board, "black")
            when [1, j] 
              @board[1][j] = Pawn.new(pos, @board, "black")
            when [6, j] 
              @board[1][j] = Pawn.new(pos, @board, "white")
            when [7, 0] || [7, 7] 
              @board[i][j] = Rook.new(pos, @board, "white")
            when [7, 1] || [7, 6]
              @board[i][j] = Knight.new(pos, @board, "white")
            when [7, 2] || [7, 5]
              @board[i][j] = Bishop.new(pos, @board, "white")
            when [7, 3]
              @board[i][j] = Queen.new(pos, @board, "white")
            when [7, 4]
              @board[i][j] = King.new(pos, @board, "white")
            end
          end
        end
    end
   
  def move_piece(start_pos, end_pos)

    row_start, col_start = start_pos
    row_end, col_end = end_pos
    if @board[row_start][col_start] == nil 
      raise ArgumentError.new("No piece")
    elsif row_end > 7 || row_end < 0 || col_end > 7 || col_end < 0
      raise ArgumentError.new("End position out of bounds")
    elsif row_start > 7 || row_start < 0 || col_start > 7 || col_start < 0
      raise ArgumentError.new("End position out of bounds")
    end
    @board[row_end][col_end] = @board[row_start][col_start]  
    @board[row_start][col_start] = nil
  end
  
end