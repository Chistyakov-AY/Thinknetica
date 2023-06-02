variable = nil

class MyClass
  def initialize
    @variable = nil
  end

  def check_variables
    puts "Переменная 'variable': #{defined?(variable)}"
    puts "Переменная '@variable': #{defined?(@variable)}"
  end

end

myclass = MyClass.new
myclass.check_variables

puts "Переменная 'variable': #{defined?(variable)}"
puts "Переменная '@variable': #{defined?(@variable)}"