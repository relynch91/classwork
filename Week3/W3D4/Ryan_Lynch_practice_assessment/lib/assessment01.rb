class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumulator = accumulator || self[0]
    self.each do |ele| 
      accumulator += prc.call(accumulator, ele)
    end
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end
  return true
end

def primes(num)
  answer = []
  i = 0
  while answer.length < num
    answer << i if is_prime?(i)
    i += 1
  end
  answer
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  answer = []
  return [1] if num == 1
  return [1, 1] if num == 2
  next_num = (num - 1) * factorials_rec(num - 1)[-1]
  answer << next_num
  #answer
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    my_hash = Hash.new { |h, k| h[k] = Array.new}
    answer = Hash.new { |h, k| h[k] = Array.new}
    self.each_with_index do |ele, idx|
      my_hash[ele] << idx
    end
    my_hash.each do |key, value|
      if my_hash[key].length > 1
        answer[key] = value
      end
    end
    answer
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    combos = Array.new
    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        combos << self[i..j]
      end
    end
    possible_subs = combos.select { |ele| ele.length > 2 }
    possible_subs.select { |ele| ele == ele.reverse }
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return [] if self.length == 0
    return self if self.length == 1
    array = self.dup
    middle = self.length / 2
    less = array.select { |ele| ele < array[middle] }
    more = array.select { |ele| ele >= array[middle] }
    # self.merge(less, more, &prc)
  end

  private
  def self.merge(left, right, &prc)

  end
end
