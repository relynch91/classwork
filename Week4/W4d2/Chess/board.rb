require_relative 'piece.rb'

class Board

  def initialize
    @board = Array.new(8) {Array.new(8)}
    (0...@board.length).each do |i|
      (0...@board.length).each do |j|
        if i == 0 || i == 1 || i ==6 || i == 7
          @board[i][j] = Piece.new
        else
          @board[i][j] = nil
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    row_start,col_start = start_pos
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