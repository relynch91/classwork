module Stepable

  def moves
    dirs = move_diffs
    return dirs
  end

  def move_diffs
    raise NoMethodError
  end

end