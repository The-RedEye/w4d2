
class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize (name, title, salary, boss)

    @name = name
    @title = title
    @salary = salary
    @boss = boss
    # boss.employees << self

  end
  
  def bonus(multiplier)
    bonus = salary * multiplier
  end

end #end Employee Class

class Manager < Employee
  
  def initialize (name, title, salary, boss)
    @employees = []
    super 
    
  end

  def bonus(multiplier)
    
    sum = @employees.inject(0) { |acc, ele| acc + ele.salary }
    
    bonus = sum * multiplier

  end


end #end Manager Class