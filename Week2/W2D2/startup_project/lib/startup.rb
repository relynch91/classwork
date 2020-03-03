require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return true if @salaries.keys.include?(title)
        false
    end

    def >(another_startup)
        self.funding > another_startup.funding
    end

    def hire(name, title)
        if valid_title?(title)
            new_employee = Employee.new(name, title)
            @employees << new_employee
        else
            raise "Not a valid title"
        end            
    end

    def size
        @employees.count
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "Not enough funding"
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        return sum / size
    end

    def close
        @employees = Array.new
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        other_salary = another_startup.salaries
        other_salary.each do |key, value|
            @salaries[key] = value if !@salaries.has_key?(key)
        end
        another_startup.employees.each do |employee|
            @employees << employee
        end
        another_startup.close
    end
end
