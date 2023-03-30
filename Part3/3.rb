#Заполнить массив числами фибоначчи до 100
array = [0, 1]
i = 1
  while array[i] < 89 do
    i += 1
    array[i]=array[i - 1] + array[i - 2]
#array << array[i]
#array.push(array[i]).pop
  end
#array.pop
print array
