require_relative "Piece.rb"
require_relative "Stepable"

class King < Piece
  include Stepable

  KING_MOVES = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [-1, 1], [1, -1], [-1, -1]]
  def move_diffs
    dirs = []
    x,y = current_pos
    KING_MOVES.each do |dir|
      x2, y2 = dir
      possible_move = [x + x2, y + y2]
      dirs << possible_move if valid_move?(possible_move)
    end
    dirs
  end

  def symbol
    :K
  end

end