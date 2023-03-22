puts "Введите коэффициент a"
a = gets.to_i
puts "Введите коэффициент b"
b = gets.to_i
puts "Введите коэффициент c"
c = gets.to_i
d = b**2 - 4*a*c
x = 1
x1 = 1
x2 = 2
if d > 0
  x1 = (-b + Math.sqrt(d))/(2*a)
  x2 = (-b - Math.sqrt(d))/(2*a)
  puts "Дискриминант равен #{d}, x1 равен #{x1}, x2 равен #{x2}."
elsif d == 0
  x = -b/(2*a)
  puts "Дискриминант равен #{d}, корень один #{x}."
  else d < 0
  puts "Корней нет"
end