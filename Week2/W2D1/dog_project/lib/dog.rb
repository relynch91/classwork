class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def bark
        if self.age > 3
            return @bark.upcase
        else
            return @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def age=(number)
        @age = number
    end

    def favorite_food?(string)
        @favorite_foods.include?(string.capitalize)
    end
end
