def circle_square(radius)
  return 3.14 * radius**2
end

puts "Введите радиус круга:"
num = gets.chomp.to_i
puts "Площадь круга: #{circle_square(num)}"

puts "Введите радиус второго круга:"
num = gets.chomp.to_i
puts "Площадь круга: #{circle_square(num)}"