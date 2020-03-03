def all_words_capitalized?(array)
    array.all? { |word| word == word[0].upcase + word[1 .. -1].downcase}
end

def no_valid_url?(array)
    valid = ['com', 'net', '.io', 'org']
    # new_array = array.map do |word|
    #     word.split('.')
    # end
    array.none? { |ele| valid.include?(ele[-3..-1])}
end

def any_passing_students?(arr)
    arr.any? do |hash|
        total = hash[:grades].sum
        average = total / hash[:grades].length
        average >= 75
    end
end