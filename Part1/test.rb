
#Заполнение массива и вывод четных и нечетных элементов
# arr = Array.new(10) { |i| i += 1; p i}
# p arr.fetch(1) { |index| index.select(&:even?) }
# p arr.select(&:even?)
# p arr.select(&:odd?)

# Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем — с нечетными.
# arr = Array.new(20) { |i| i += 1 }
# arr_even = []
# arr.each_with_index do |elem, index|
#   arr_even << elem if index % 2 != 0
# end
# pp arr
# pp arr_even

# # Последовательность Фибоначчи
# def fib(n)
#   return n if n <= 1
#   fib(n - 1) + fib(n - 2)
# end

# def fib_arr
#   sum = 0
#   arr = Array.new(20) { |i| i += 1 }
#   arr_fib = []
#   arr.each do |i| 
#   arr_fib << fib(i) 
#   end
#   p arr_fib
#   p arr
# end

# class C

# end
 
# a = C.new

# p a.class
# p a.class.superclass
# p C.class
# p C.class.superclass
# p C.superclass

# arr2 = [7, 6]
# arr = [1, 2, arr2, 4, 5]
# def move_position(arr, n1, right_of:)
#   arr.insert(right_of, arr.delete_at(n1))
# end
# move_position(arr, arr[1], right_of: 3)
# p arr

# реверсия массива
# arr = Array.new(10) { |i| i += 1}
# p arr
# r_arr = []
# for item in arr do
#   r_arr.unshift(item)
# end
# p r_arr

# индекс минимального элемента
# a = [3, 4, 1, 5]
# p a.index(a.min)

# g = 'Hello'
# p g[4..-1]
# p g[1..3]

# при удалении возвращается значение
arr = Array.new(10) { |i| i += 1}
new_arr = []
new_arr << arr.delete_at(0)
p new_arr
p arr