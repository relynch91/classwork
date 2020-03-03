def my_map(array, &proc)
    answer = Array.new
    array.each do |ele|
        answer << proc.call(ele)
    end
    answer 
end

def my_select(array, &prc)
    answer = Array.new
    array.each do |ele|
        answer << ele if prc.call(ele)
    end
    answer 
end

def my_count(array, &proc)  
    count = 0
    array.each do |ele|
        count += 1 if proc.call(ele)
    end
    count
end

def my_any?(array, &proc)
    array.each do |ele|
        return true if proc.call(ele)
    end
    false
end

def my_all?(array, &proc)
    array.each do |ele|
        return false if !proc.call(ele)
    end
    true
end

def my_none?(array, &block)
    array.each do |ele|
        return false if block.call(ele)
            
    end
    true
end