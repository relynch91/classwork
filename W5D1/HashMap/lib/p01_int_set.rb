require "byebug"

class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num >= @max || num < 0
      raise "Out of bounds"
    end
    @store[num] = true

  end

  def remove(num)
    @store[num] = false
  end


  def include?(num)
    @store[num]
    # return true if @store[num]
    # return false if @store[num] == nil
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % num_buckets
    unless store.include?(num)
      @store[bucket] << num
      return true
    end
  end

  def remove(num)
    bucket = num % num_buckets
    @store[bucket].delete(num)

  end

  def include?(num)
    bucket = num % num_buckets
    @store[bucket].each do |ele|
      if ele == num 
        return true
      end
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :store
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == num_buckets
      resize!
    end
    bucket = num % num_buckets
    unless store[bucket].include?(num)
      @store[bucket] << num
      @count += 1
      return true
    end
    false 
  end

  def remove(num)
    bucket = num % num_buckets
    if store[bucket].delete(num)
      @count -= 1
    end

  end

  def include?(num)
    bucket = num % num_buckets
    @store[bucket].each do |ele|
      if ele == num 
        return true
      end
    end
    false
  end 

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num = num_buckets * 2
    result = Array.new(new_num) { Array.new } 
    @store.each do |subarray|
      subarray.each do |ele|
        result[ele % new_num] << ele
      end
    end
    @store = result
  end
end
