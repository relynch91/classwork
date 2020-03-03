class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = Array.new
        self.my_each { |ele| selected << ele if prc.call(ele) }
        selected
    end

    def my_reject(&prc)
        selected = Array.new
        self.my_each { |ele| selected << ele if !prc.call(ele) }
        selected
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }
        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele) }
        true
    end

    def my_flatten
        answer = Array.new
        self.each do |ele|
            if ele.is_a?(Array)
                answer += ele.my_flatten
            else 
                answer << ele 
            end
        end
        answer
    end

    def my_zip(*args)
        answer = Array.new(self.length) {Array.new} 
        (0...self.length).each do |i|
            answer[i] << self[i]
            args.each {|ele| answer[i] << ele[i]}
        end
        answer
    end

    def my_rotate(n = 1) 
        if n > 0
            my_rotate_positive(n)
        else
            my_rotate_negative(n)
        end
        self
    end

    def my_rotate_positive(n = 1)
        n.times do 
            ele = self.shift
            self << ele 
        end
        self
    end

    def my_rotate_negative(n = 1)
        num = n.abs
        num.times do 
            ele = self.pop
            self.unshift(ele)
        end
        self
    end

    def my_join(string = "")
        result = ""
        self.each_with_index do |ele, index|
            if index == self.length - 1
                result += ele
            else
                result += ele + string
            end
        end
        result
    end

    def my_reverse
        result = Array.new
        (self.length - 1).downto(0).each do |i|
            result << self[i] 
        end
        result
    end

end

# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
    answer = Array.new
    (1..num).each { |i| answer << i if num % i == 0 }
    answer
end

# factors(15)
# factors(40)
# factors(2)
# factors(1)


# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
#   def bubble_sort!()
#     sorted = false
#     while !sorted
#         sorted = true
#         (0...self.length-1).each do |i|
#             if self[i] > self[i+1]
#                 sorted = false
#                 self[i], self[i+1] = self[i+1], self[i]
#                 break
#             end
#         end
#     end
#     self
#   end

  def bubble_sort
    arr = self.dup.bubble_sort!()
  end

  def bubble_sort!(&prc)
    sorted = false
    prc ||= Proc.new { |a, b| a <=> b }
    while !sorted
        sorted = true
        (0...self.length-1).each do |i|
            # if self[i] > self[i+1]
            #     sorted = false
            #     self[i], self[i+1] = self[i+1], self[i]
            #     break
            # end
            # a = prc.call(self[i])
            # b = prc.call(self[i + 1])
            if prc.call(self[i], self[i + 1]) == 1
                sorted = false
                self[i], self[i+1] = self[i+1], self[i]
                break
            end
        end
    end
    self    
  end
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
    substrings = Array.new
    (0...string.length).each do |i|
        (i...string.length).each do |j|
            substrings << string[i..j] 
        end
    end
    substrings
end

def subwords(word, dictionary)
    substring = substrings(word)
    substring.select { |word| dictionary.include?(word) }
end

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
    array.map {|ele| ele*2}
end

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

# class Array
#   def my_each(&prc)
#   end
# end

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
#   def my_map(&prc)
#   end

#   def my_select(&prc)
#   end

  def my_inject(&blk)
    count = 0
    self.my_each do |el|
        count = blk.call(count, el)
    end
    count
  end
end

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
    strings.inject("") {|acc,el| acc += el}
end