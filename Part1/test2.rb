# hash = { a: 1, b: 0, c: 3 }
# hash.each do |key, value|
#   if key == :a
#     hash[key] = 'str+'
#   end
# end
# p hash



arr = Array.new(10) { |i| i + 1} 
p arr
s = arr.select { |x| x + 5 }
p s

#Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.
# a = [1, 2, 4, 5, 2, 1, 6, 11]
# p (a.partition.with_index { |x, index| index.even?}).flatten
#  p a