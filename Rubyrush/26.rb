puts "0 - камень, 1 - ножницы, 2 - бумага"
arr = ["камень", "ножницы", "бумага"]
comp = rand(3) # от 0 до 2
puts "#{comp}"
num = gets.chomp.to_i

if num > 2 || num < 0
  puts "Неправильно"
else
  puts "Вы выбрали #{arr[num]}"
  puts "Комп выбрал (#{comp}) - #{arr[comp]}\n\n"
  if num == comp
    puts "У вас ничья"
  else
    if num == 0 && comp == 1
      puts "Вы победили!"
    else
      if num == 0 && comp == 2
        puts "Победил комп!"
      else
        if num == 1 && comp == 2
          puts "Вы победили!"
        else
          if num == 1 && comp == 0
            puts "Победил комп!"
          else
            if num == 2 && comp == 0
              puts "Вы победили!"
            else
              if num == 2 && comp == 1
                puts "Победил комп!"
              else
                puts "Finish"
              end
            end  
          end
        end
      end
    end
  end
end

