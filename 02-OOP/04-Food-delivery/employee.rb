class Employee

  attr_accessor :name, :password, :restaurant

  def initialize(name, password)
    @name = name
    @password = password
  end

  def manager?
    false
  end

  def self.find_employee(employees, given_name)
    employees.each do |employee|
      return employee if employee.name == given_name
    end
    nil
  end

end