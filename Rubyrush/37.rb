def stars(number)
  x = "*"
  puts "Результат -> #{x * number}"

end

puts "Введите кол-во звезд:"
num = gets.chomp.to_i
stars(num)
