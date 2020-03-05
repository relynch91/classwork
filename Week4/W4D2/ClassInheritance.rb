class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    @employees = Array.new
    super
  end

  def bonus(multiplier)
    return nil if employees.length == nil 
    # return self.salary * multiplier if self.is_a?Employee
    sum = 0
    @employees.each do |employee|
      if employee.is_a?Employee 
        sum += employee.salary * multiplier
      else 
        sum += employee.bonus(multiplier) 
      end
    end
    sum
  end
end

ned = Manager.new("Ned", "Founder", 1000000, boss= nil)
darren = Manager.new("Darren", "TA Manager", 78000, boss= ned)
shawna = Employee.new("Shawna", "TA", 12000, boss= darren)
david = Employee.new("David", "TA", 10000, boss= darren)

ned.employees << darren
darren.employees << shawna 
darren.employees << david 


