puts "Отгадайте число от 0 до 16."
num = gets.to_i
arr = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
unknown = arr.sample

if arr.include?(num) && num == unknown
  puts "Вы угадали"
  abort
else
  if arr.include?(num) == false 
    puts "Число не входит в данный диапазон."
  else  
    if (num - unknown).abs < 3
      puts "Тепло"
    else
      puts "Холодно"
    end
  end       
end

puts "Вторая попытка"
num = gets.to_i
if arr.include?(num) && num == unknown
  puts "Вы угадали"
  abort
else
  if arr.include?(num) == false 
    puts "Число не входит в данный диапазон."
  else  
    if (num - unknown).abs < 3
      puts "Тепло"
    else
      puts "Холодно"
    end
  end       
end

puts "Последняя попытка"
num = gets.to_i
if arr.include?(num) && num == unknown
  puts "Вы угадали"
  abort
else
  if arr.include?(num) == false 
    puts "Вы не угадали с 3-х попыток и число не входит в данный диапазон."
  else  
    puts "Вы не угадали с 3-х попыток. Загаданное число -  #{unknown}"
  end       
end