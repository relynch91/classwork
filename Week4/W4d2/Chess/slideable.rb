module Slideable

  HORIZONTAL_DIR = [:Q, :R]
  DIAGONAL_DIR = [:B, :Q]

  def horizontal_dirs
    
  end

  def diagonal_dirs 

  end

  def moves
    dir = move_dirs
    if dir == HORIZONTAL_DIR
      return horizontal_dirs
    elsif dir == DIAGONAL_DIR
      return diagonal_dirs

  end

  private
  def move_dirs

  end

end