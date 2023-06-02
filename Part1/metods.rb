def shout_and_wait(message)
  puts message
  #sleep 1
end
shout_and_wait "Поехали"
shout_and_wait "Первый километр"
shout_and_wait "Второй километр"
shout_and_wait "Третий километр"

puts "Приехали!"
gets
#____________________________________

def circle_square(radius)
  #return 3.14159 * radius * radius
  s = 3.14*radius**2
  p s
end
p "Введите радиус круга"
r = gets.chomp.to_i
circle_square(r)
#____________________________________

def first_elements(array, number)
  # Объявим пустой массив, куда будем записывать элементы нового массива
  result_array = []

  # Счетчик элементов и одновременное индекс в исходном массиве array,
  # который будет передан в метод
  counter = 0

  while counter < number
    # Проверка: если длина массива array оказалась меньше, чем число элементов,
    # которые мы хотим «забрать», то просто прерываем этот цикл
    if array.size <= counter
      break
    end

    # Кладем в конечный массив число, которое находится в массиве array на
    # позиции counter
    result_array << array[counter]

    counter += 1
  end

  # Вернем нужный массив
  return result_array
end

# Создадим переменную original_array, в которую запишем исходный массив
original_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

# Выведем массив пользователю
puts 'Вот какая палка колбасы у нас есть: '
puts original_array.to_s

# Спросим у пользователя, сколько элементов ему нужно и запишем это в переменную
# number, предварительно преобразовав к числу
puts 'Сколько первых элементов вам отрезать?'
number = gets.to_i

# Выведем пользователю нужное количество элементов, используя наш метод
puts 'Вот ваша колбаса:'
puts first_elements(original_array, number).to_s