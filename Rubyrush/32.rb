if (ARGV[0] == nil)
  abort "Нужен какой-нибудь аргумент!"
else 
  puts "#{ARGV[0]}"
end

questions = ["Вопрос?", "rgfg", 3, 4]
yes_answers = 0

for item in questions do
  puts item
  user_input = nil
  while (user_input != "yes" and user_input != "no")
    puts "Введите yes или no"
    user_input = STDIN.gets.chomp.downcase
  end
  if (user_input == "yes")
    yes_answers += 1
  end
end
p yes_answers