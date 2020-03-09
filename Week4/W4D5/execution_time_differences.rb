require "byebug"
require "benchmark"


# def my_min(list)
#   # new_array = []
#   minimum = nil 
#   (0...list.length - 1).each do |i|
#     min = true
#     (0...list.length).each do |j|
#       if list[i] > list[j]
#         min = false
#       end
#     end
#     if min
#       minimum = list[i]
#     end
#   end
#   minimum
# end

# def my_min(list)
#   acc = list.shift
#   list.inject(acc) { |acc, ele|  acc > ele ? acc = ele : acc }
# end

# list = [ 10, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min(list) # =>  -5

# def sub_sum(arr)
#   answer = []
#   (0...arr.length).each do |i|
#     (0...arr.length).each do |j|
#       subarr = arr[i..j]
#       answer << subarr
#     end
#   end
#   max = 0
#   answer.each do |ele|
#     max = ele.sum if max < ele.sum
#   end
#   max
# end

# list = [5, 3, -7]

# p sub_sum(list)

def sub_sum(arr)
  max = arr[0] 
  curr_sum = 0
  (1...arr.length).each do |i| 
    ele = arr[i] 
    curr_sum += ele
      if curr_sum > max
        max = curr_sum
      end
      if (curr_sum) < 0
        curr_sum = 0
      end
  end
  max
end

list = [2, 3, -6, 7, -6, 7]
b_list = [-5, -1, -3]
c_list = [-4, -5, -6, -7, -8, 9] 

p sub_sum(list)
p sub_sum(b_list)
p sub_sum(c_list)