def check_number(number)
  puts "Popitka 1"
  num = gets.chomp.to_i
  if number == num
    puts "Otgadali 1"
    abort
  else
    puts "Popitka 2"
    num = gets.chomp.to_i
    if number == num
      puts "Otgadali s 2"
      abort
    else
      puts "Popitka 3"
      num = gets.chomp.to_i
      if number == num
        puts "Otgadali s 3"
        abort
      else
        puts "Mimo"
        abort
      end
    end
  end
end

puts "Отгадайте число с 3х попыток!"
number = rand(16)
p "Comp - #{number}"
check_number(number)
# i = 1
# while i <= 3
#   check_number(number)
#   i += 1
# end 

