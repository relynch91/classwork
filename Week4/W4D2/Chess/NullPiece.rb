require "singleton"
require_relative "Piece.rb"

class NullPiece < Piece 
  include Singleton
  # attr_accessor :color, :symbol

  def initialize

  end

  def moves 

  end

  def symbol

  end
  
end