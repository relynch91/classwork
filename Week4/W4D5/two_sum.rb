require "byebug"

# arr = [0, 1, 5, 7]

# # def bad_two_sum?(arr, target)
# #   (0...arr.length-1).each do |i|
# #     (i +1...arr.length).each do |j|
# #       return true if arr[i] + arr[j] == target
# #     end
# #   end
# #   return false
# # end

# # p bad_two_sum?(arr, 6) # => should be true
# # p bad_two_sum?(arr, 10) # => should be false

# def okay_two_sum?(arr, target)
#   sorted = quicksort(arr)
#   return true if b_search(sorted, target)
#   false
# end

# def b_search(arr, target)
#   return nil if arr.length < 1
#   middle = arr.length / 2
#   middle_ele = arr[middle]
#   return middle if middle_ele == target
#   if target < middle_ele
#     left = arr[0...middle]
#     b_search(left, target)
#   else 
  
#     val = b_search(arr[middle + 1..-1], target) 
#     return nil if val == nil
#     middle + 1 + val
  
#   end
# end

# # p b_search([1, 3, 5, 7, 8, 9], 9)

# def quicksort(array)
#   return array if array.length <= 1
#   pivot = array.first
  
#   left_array = array.drop(1).select { |ele| ele < pivot }
#   right_array = array.drop(1).select { |ele| ele >= pivot }
#   result_left = quicksort(left_array)
#   result_right = quicksort(right_array)
#   result_left + [pivot] + result_right
# end
# arr = [5, 0, 1, 7, 6]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(array, target)
  my_hash = Hash.new(false)
  array.each do |ele|
    debugger 
    if my_hash[target - ele] == true 
      return true
    end
    my_hash[ele] = true
  end
  false 
end

arr = [5, 0, 6, 2, 1, 3, 7, 6]

 #two_sum?(arr, 6) # => should be true
p two_sum?(arr, 9) # false 