arr = [1, 2, 3, 4, 5, 6, 7]
unarr = []
for item in arr do
  unarr.unshift(item)
  item += 1 
end
p unarr

puts "Введите число"
num = gets.chomp.to_i
x = 1
arr = []
unarr = []
while x <= num do
  arr << x
  x += 1  
end
p arr
for item in arr do
  unarr.unshift(item)
  item += 1 
end
p unarr