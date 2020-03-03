def my_reject(array, &proc)
    array.select { |numb| !proc.call(numb) }
end

def my_one?(arr, &prc)
    count = 0
    arr.each do |ele|
        count += 1 if prc.call(ele)
    end
    count == 1
end

def hash_select(hash, &proc)
    new_hash = Hash.new
    hash.each do |key, value|
       new_hash[key] = value if proc.call(key, value)
    end
    new_hash
end


def xor_select(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |ele|
        count = 0
        count += 1 if prc_1.call(ele)
        count += 1 if prc_2.call(ele)
        new_arr << ele if count == 1
    end
    new_arr
end

def proc_count(value, array)
    overall = 0
    array.each do |proc|
        overall += 1 if proc.call(value)
    end
    overall
end