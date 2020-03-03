def zip(*arrays)
    my_hash = Hash.new { |h, k| h[k] = [] }
    arrays.each do |array|
        (0...array.length).each do |i|
            my_hash[i] << array[i]
        end
    end
    my_hash.values
end

def prizz_proc(array, proc_1, proc_2)
    answer = []
    array.each do |ele|
        count = 0
        count += 1 if proc_1.call(ele)
        count += 1 if proc_2.call(ele)
        answer << ele if count == 1
    end
    answer
end

def zany_zip(*arrays)
    max = 0
    arrays.each do |array|
        max = array.length if array.length > max
    end
    my_hash = Hash.new { |h, k| h[k] = [] }
    arrays.each do |array|
        (0...max).each do |i|
            my_hash[i] << array[i] if array[i]
end