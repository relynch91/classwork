# require_relative "slideable.rb"

class Piece
  # include slideable
  attr_accessor :color 
  def initialize(start_pos, board, color)
    @current_pos = start_pos
    @board = board
    @color = color
  end

  def symbol
    raise "No method error"
  end
  
  def moves
    raise "no method error"
  end

end