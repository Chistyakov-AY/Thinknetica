def first_elements(array, number)
  arr = []
  item = 1
  while item <= array
    arr << item #rand(100)
    item += 1
  end
  p arr
  p arr.first(number)
end

puts "Введите кол-во элементов:"
arr = gets.chomp.to_i
puts "Сколько первых элементов вам отрезать?"
num = gets.chomp.to_i

first_elements(arr, num)


# Вот какая палка колбасы у нас есть: 
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
# Сколько первых элементов вам отрезать?
# > 3
# Вот ваша колбаса:
# [1, 2, 3]