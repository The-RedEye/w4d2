
class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize (name, title, salary, boss)

    @name = name
    @title = title
    @salary = salary
    @boss = boss

  end
  
  def bonus(multiplier)
    bonus = salary * multiplier
  end

end #end Employee Class

class Manager < Employee

  attr_writer :employees
  
  def initialize (name, title, salary, boss)
    @employees = []
    super 
    
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    
    bonus = total_employee_salary * multiplier

  end

  def total_employee_salary
    sum = 0
    @employees.each do |employee|
      if employee.instance_of?(Employee)
        sum += employee.salary
      else
        sum += employee.salary + employee.total_employee_salary
      end
    end
    sum
  end


end #end Manager Class

ned = Manager.new("Ned", "Founder", 1000000,	nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000