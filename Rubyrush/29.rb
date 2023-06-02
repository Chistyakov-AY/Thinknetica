p "Введите число N"
num = gets.chomp.to_i
arr = []
while arr.size < num do
  arr << rand(100)
end
 p arr

puts "Максимальное числов массиве #{arr.max}"

p "Введите число N"
num = gets.chomp.to_i
arr = []
index = 0
while index < num do
  arr << rand(100)
  index += 1
end
p arr

max_value = 0 
for item in arr do
  if item > max_value
    max_value = item
  end  
end    

puts "Максимальное числов массиве #{max_value}"