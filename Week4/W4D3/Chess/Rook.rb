require_relative 'Slideable.rb'
require_relative "Piece.rb"

class Rook < Piece
  include Slideable



  def move_dirs(current_pos)
    x, y = current_pos
    result_dirs = []
    HORIZONTAL_DIR.each do |dir|
      row, col = dir
      possible_pos = [x + row, y + col]
      result_dirs << possible_pos if valid_move?(possible_pos)
    end
    result_dirs
  end




def smybol
  :R
end

end