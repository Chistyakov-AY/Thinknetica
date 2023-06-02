p "Введите число N"
num = gets.chomp.to_i
arr = []
int = 1
sum = 0
while int <= num do
  arr << int
  sum += int
  int += 1
end
 p arr

puts "Сумма чисел #{sum}"