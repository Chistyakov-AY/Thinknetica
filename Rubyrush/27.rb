count = 1
while count <= 5 do
  puts count
  count += 1
  #sleep 0.5
end
puts "я иду искать!"


array = [1,2,3,4,5]
for item in array do
  puts item
end


names = []
user_input = nil
while user_input != "" do
  user_input = gets.chomp
  names << user_input
end
for item in names do
    puts "C нами " + item
    sleep 1
  
    if (item == "5")
      puts "Элис??? Кто такая Элис?"
      sleep 1
      break
    end
  end
  
  puts "Что это за девочка и где она живет?"
  sleep 1
  puts "А вдруг она не курит? А вдруг она не пьёт?"
  sleep 1
  puts "А мы с такими рожами возьмем да и припрёмся к Элис... :)"