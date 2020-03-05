require 'byebug'

module Slideable

  HORIZONTAL_DIR = [
    [0, 1], [0, -1], [1, 0], [-1, 0]
  ]
  DIAGONAL_DIR = [
    [1, 1], [-1, 1], [1, -1], [-1, -1]
  ]

  def moves
    all_moves = []
    dirs = move_dirs(current_pos)  # dirs = [[1,1],[0,1]]
    dirs.each do |dir| #dirs is one move away 
      x0, y0 = current_pos
      x1, y1 = dir
      dx  = x1 - x0
      dy = y1 - y0
      all_moves += grow_unblocked_moves(dx, dy)
    end
    all_moves
  end

  private

  def move_dirs 
    raise NoMethodError
  end

  def grow_unblocked_moves(dx,dy)
  
    x, y = current_pos
    grown_moves = []
    case [dx, dy]
    when [1, 0]
      i = 1
      while valid_move?([x + i, y]) && empty?([x + i, y])
      grown_moves << [x + i, y]
        i += 1
      end
      if valid_move?([x + i, y]) && @board[x + i][y].color != self.color
        grown_moves << [x + i, y]
      end
    when [-1, 0]
      i = -1
      while valid_move?([x + i, y]) && empty?([x + i, y])
        grown_moves << [x + i, y]
        i -= 1
      end
      if valid_move?([x + i, y]) && @board[x+i][y].color != self.color
        grown_moves << [x + i, y]
      end

    when [0, 1]
      i = 1
      while valid_move?([x, y + i]) && empty?([x, y + i])
        grown_moves << [x, y + i]
          i += 1
      end
      if valid_move?([x, y + i]) && @board[x][y+i].color != self.color
        grown_moves << [x, y + i]
      end
    when [0, -1]
      i = -1
      while  valid_move?([x, y + i]) && empty?([x, y + i])
        grown_moves << [x, y + i]
        i -= 1
      end
      if valid_move?([x, y + i]) && @board[x][y + i].color != self.color
        grown_moves << [x, y + i]
      end
    when [1, 1]
      i = 1
      while valid_move?([x + i, y + i]) && empty?([x + i, y + i]) 
        grown_moves << [x + i, y + i]
        i += 1
      end
      if valid_move?([x + i, y + i]) && @board[x + i][y + i].color != self.color
        grown_moves << [x + i, y + i]
      end

    when [1, -1] 
      i = 1
      while valid_move?([x + i, y - i]) && empty?([x + i, y - i])
        grown_moves << [x + i, y - i]
        i += 1
      end
      if valid_move?([x + i, y - i]) && @board[x + i][y - i].color != self.color
        grown_moves << [x + i, y - i]
      end
    when [-1, 1]
      i = 1
      while valid_move?([x - i, y + i]) && empty?([x - i, y + i])
        grown_moves << [x - i, y + i]
        i += 1
      end
      if valid_move?([x - i, y + i]) && @board[x - i][y + i].color != self.color
        grown_moves << [x - i, y + i]
      end
    when [-1, -1]
      i = 1
      while valid_move?([x - i, y - i]) && empty?([x - i, y - i])
        grown_moves << [x - i, y - i]
        i += 1
      end
      if valid_move?([x - i, y - i]) &&  @board[x + i][y + i].color != self.color
        grown_moves << [x + i, y + i]
      end
    end
    return grown_moves
  end

end


# bish = Bishop.new([3,3],b,"black")