class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  # **Do NOT use the built-in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    if prc.nil? 
      prc = Proc.new { |x, y| x <=> y }
    end

    return self if self.length <= 1
    midpoint = self.length / 2
    left_array = self.take(midpoint).merge_sort(&prc)

    right_array = self.drop(midpoint).merge_sort(&prc)
    Array.merge(left_array, right_array, &prc)
  end

  private
  def self.merge(left, right, &prc)
    answer = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        answer  << left.shift
      when 0
        answer  << left.shift
      when 1
        answer  << right.shift
      end
    end
    answer  + left + right 
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    answer = Array.new
    (0...self.length - 1).each do |i|
      (i + 1...self.length).each do |j|
        if self[i] + self[j] == target
          answer << [i, j]
        end
      end
    end
    answer 
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # **Do NOT use the built-in `Array#flatten` method in your implementation.**

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil) 
    return self if self.length == 0
    return self if self.length == 1
    return self if level == 0
    answer = Array.new 
    if level == nil
      self.each do |ele|
        if ele.is_a?Array
          flattened = ele.my_flatten
          answer += flattened
        else 
          answer << ele 
        end
      end
      return answer
    else 
        self.each do |ele|
        if ele.is_a?Array
          flattened = ele.my_flatten(level - 1)
          answer += flattened
        else 
          answer << ele 
        end
      end
    end
    return answer
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    answer = Array.new
    (0...self.length - 1).each do |i|
      (i + 1...self.length).each do |j|
        ele = self[i..j]
        if ele == ele.reverse
          answer << ele
        end
      end
    end
    answer.select { |ele| ele.length > 2 }
  end
end


# Write a method `nth_prime` that returns the nth prime number. You may wish to
# use an `is_prime?` helper method.

def nth_prime(n)
    answer = Array.new
    i = 2
    while answer.length < n
      if is_prime?(i)
        answer << i
      end
      i += 1
    end
    answer[-1]
end

def is_prime?(num)
  return false if num < 2 
  (2...num).each do |i|
    if num % i == 0
      return false 
    end
  end
  true 
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    (0...self.length).each do |i|
      prc.call(self[i])
    end
    self
  end
end

class Array
  # Write an `Array#my_select` method that returns an array made up of the
  # elements in the array that return `true` from the given block.
  # **Do NOT use the built-in `Array#select` or `Array#reject` methods in your
  # implementation.**

  def my_select(&prc)
    answer = Array.new 
    self.each do |ele|
      if prc.call(ele)
        answer << ele 
      end
    end
    answer 
  end
end

