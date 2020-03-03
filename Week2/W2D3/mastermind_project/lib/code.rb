require 'byebug'

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs

  def self.valid_pegs?(arr_chars)
    arr_chars.each do |peg|
      return false if !POSSIBLE_PEGS.include?(peg.upcase)
    end
    true
  end 

  def initialize(arr_chars)
    if Code.valid_pegs?(arr_chars) 
      @pegs = arr_chars.map { |ele| ele.upcase }
    else
      raise "pegs aren't valid"
    end
  end

  def self.random(length)
    letters = Array.new
    possible = POSSIBLE_PEGS.keys
    (0...length).each do |i|
      letters[i] = possible.sample
    end
    Code.new(letters)
  end

  def self.from_string(string)
    Code.new(string.chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...@pegs.length).each do |i|
      if @pegs[i] == guess.pegs[i]
        count += 1
      end
    end
    count 
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do  |ele, i|
      if @pegs.include?(ele) && @pegs[i] !=  ele
        count += 1
      end
    end
    count
  end

  def ==(instance)
    self.pegs == instance.pegs
  end
end
