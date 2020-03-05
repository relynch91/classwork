require "byebug"

class Piece
  attr_accessor :color, :current_pos, :board 
  def initialize(start_pos, board, color)
    @current_pos = start_pos
    @board = board
    @color = color
  end

  def valid_move?(pos)
    #debugger 

    row, col = pos
    if row > 7 || row < 0 || col > 7 || col < 0 
      return false
    elsif @board[row][col].color == self.color
      return false
    end
    true
  end

  def empty?(pos) 
    row, col = pos
    return true if @board[row][col].is_a?(NullPiece)
    false    
  end

  def symbol
    raise "No method error"
  end
  
  def moves
    raise "no method error"
  end

end