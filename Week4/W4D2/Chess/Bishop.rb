require_relative 'Slideable.rb'
require_relative "Piece.rb"

class Bishop < Piece
  include Slideable

  def move_dirs(current_pos)
    x, y = current_pos
    result_dirs = []
    DIAGONAL_DIR.each do |dir|
      row, col = dir
      possible_pos = [x + row, y + col]
      result_dirs << possible_pos if valid_move?(possible_pos)
    end
    result_dirs
  end

def smybol
  :B
end

end