def reverser(string, &proc)
    proc.call(string.reverse)
end

def word_changer(string, &proc)
    answer = Array.new
    string.split.each do |word|
        x = proc.call(word)
        answer << x
    end
    answer.join(" ")
end

def greater_proc_value(numb, proc_2, proc_1)
    return proc_1.call(numb) if proc_1.call(numb) > proc_2.call(numb)
    proc_2.call(numb)
end

def and_selector(array, proc_1, proc_2)
    answer = []
    array.each do |ele|
        answer << ele if proc_1.call(ele) && proc_2.call(ele)
    end
    answer 
end

def alternating_mapper(array, proc_1, proc_2)
    answer = []
    (0...array.length).each do |i|
        if i % 2 == 0
            answer << proc_1.call(array[i])
        else
            answer << proc_2.call(array[i])
        end
    end
    answer
end