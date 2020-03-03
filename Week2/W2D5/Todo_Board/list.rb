require_relative 'item.rb'
require "byebug"

class List
    attr_accessor :list
    def initialize(label)
        @label = label
        @items = Array.new
    end

    def add_item(title, deadline, description="")
        new = Item.new(title, deadline, description)
        if Item.valid_date?(deadline)
            @items << new
            return true 
        else
            return false 
        end
    end

    def size 
        @items.length
    end

    def valid_index?(numb)
        return true if numb >= 0 && numb < size
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        return nil if valid_index?(index)
        return @item[index]
    end

    def priority
        @items[0]
    end

    LINE_WIDTH = 42
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10

    def print
        puts "$" * (LINE_WIDTH)
        puts " " * 16 + @label.upcase
        puts "$"* LINE_WIDTH
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} ! #{'Item'.ljust(ITEM_COL_WIDTH)} ! #{'Deadline'.ljust(DEADLINE_COL_WIDTH)}"
        puts "$"*LINE_WIDTH
        @items.each.with_index do |item, i|
            puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} ! #{item.title.ljust(ITEM_COL_WIDTH)} ! #{item.deadline.ljust(DEADLINE_COL_WIDTH)}"
        end
        puts "-" * LINE_WIDTH
    end

    def print_full_item(index)
        raise "Not a valid index" if valid_index?(index)
        item = @item[index]
        puts "$" * 42
        puts "#{item.title}"
        puts "#{item.deadline}"
        puts "#{item.description}"
    end

    def print_priority
        print_full_item(priority)
    end

    def up(index, amount=1)
        return false if valid_index?(index)
        total = amount
        while total > 0
            incremented_index = index - 1
            if swap(index - 1, index)
                total -= 1
            else
                total = 0
            end
        end
        return true 
    end

    def down(index, amount=1)
        #debugger
        return false if !valid_index?(index)
        count = amount
        while count < amount
            if swap(index, index + 1)
                total += 1
            else
                total = amount
            end
        end
        return true
    end
end
