puts "Введите самое любимое слово"
string = gets.chomp.to_s
arr = string.split('')
arr1 = []
num = arr.size

for item in arr do
  arr1 << item
end

until arr1.empty?
  p = arr1.join(" ").to_s
  p p.capitalize
  arr1.pop
end

