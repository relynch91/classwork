class Item
    attr_reader :deadline 
    def self.valid_date?(date_string)
        numbs = date_string.split("-")
        return false if numbs.length != 3 
        (0...numbs.length).each do |i|
            case i
            when 1
                x = numbs[1].to_i
                return false if x < 1 || x > 12 
            when 2 
                x = numbs[2].to_i
                return false if x < 1 || x > 31
            end
        end
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        # unless Item.valid_date?(deadline)
        #     raise "That is not a valid date"
        #     return false
        # end
        @description = description
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
         if Item.valid_date?(new_deadline)
            @deadline = new_deadline
         else 
            raise "Not a valid date"
         end
    end

    def description
        @description
    end

    def description=(new_discrition)
        @description = new_discrition
    end

end
    
# Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false
