require_relative "Piece.rb"
require_relative "Stepable"

class Knight < Piece
  include Stepable

  KNIGHT_MOVES = [[1, 2], [1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1], [-1, 2], [-1, -2]]
  def move_diffs
    dirs = []
    debugger 
    x, y = current_pos
    KNIGHT_MOVES.each do |dir|
      x2, y2 = dir
      possible_move = [x + x2, y + y2]
      dirs << possible_move if valid_move?(possible_move)
    end
    dirs
  end

  def symbol
    :N
  end

end