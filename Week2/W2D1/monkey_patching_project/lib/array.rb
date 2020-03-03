# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
   def span 
        return nil if self.length == 0
        if self.all? { |ele| ele.is_a?(Integer) }
            self.max - self.min
        end
   end

   def average
        return  nil if self.length == 0
        if self.all? { |ele| ele.is_a?(Integer) }
            self.sum / (self.length * 1.0)
        end
    end

    def median
        return nil if self.length == 0

        if self.length % 2 == 0
            middle = self.length / 2
            return (self.sort[middle] + self.sort[middle-1]) / 2.0
        else
            return self.sort[self.length/2]
        end
    end

    def counts
        answer = Hash.new(0)

        self.each do |ele|
            answer[ele] += 1
        end

        answer
    end

    def my_count(value)
        count = 0
        self.each do |ele|
            count += 1 if ele == value
        end
        count
    end

    def my_index(value)
        # index_r = Array.new
        self.each_with_index do |ele, idx|
            return idx if ele == value
        end
        nil
    end

    def my_uniq
        new_array = Array.new
        self.each do |ele|
            new_array << ele if !new_array.include?(ele)
        end
        new_array
    end

    def my_transpose
        answer = Array.new(self.length) { Array.new([]) }
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                answer[j][i] = self[i][j]
            end
        end
        answer
    end
end
