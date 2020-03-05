require_relative "Piece.rb"

class Pawn < Piece
  attr_reader :possible_dirs, :first_move
  PAWN_MOVES_FORWARD = [[2, 0], [1, 0]]
  PAWN_MOVES_BACKWARD = [[-2, 0], [-1, 0]]

  def initialize(start_pos, board, color)
    super
    @first_move = true
    @possible_dirs = PAWN_MOVES_FORWARD if color == 'black'
    @possible_dirs = PAWN_MOVES_BACKWARD if color == 'white'
  end

  def move_diffs
    x, y = current_pos
    result_dirs = []
    if first_move
      possible_dirs.each do |ele|
        x2, y2 = ele
        potential_dir = [x2 + x, y2 + y]
        result_dirs << potential_dir if valid_move?(potential_dir)
      end
      @first_move = false
    else
      possible_dirs[1..-1].each do |ele|
        x2, y2 = ele
        potential_dir = [x2 + x, y2 + y]
        result_dirs << potential_dir if valid_move?(potential_dir)
      end
    end
    result_dirs += side_attacks
    return result_dirs
  end

  def side_attacks
    answer = Array.new
    x, y = @current_pos

    if @color == "black"
      if @board[x + 1][y + 1].color != @color && !empty?([x + 1, y + 1])
        answer << [x + 1, y + 1]
      end
      if @board[x + 1][y - 1].color != @color && !empty?([x + 1, y - 1])
        answer << [x + 1, y - 1]
      end
    else 
      if @board[x - 1][y + 1].color != @color && !empty?([x - 1, y + 1])
        answer << [x - 1, y + 1]
      end
      if @board[x - 1][y - 1].color != @color && !empty?([x - 1, y - 1])
        answer << [x - 1, y - 1]
      end
    end
    answer 
  end

  def symbol 
    :P
  end
end