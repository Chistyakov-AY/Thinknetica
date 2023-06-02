errors = 0
good_letters = []
bad_letters = []

def get_letters
  slovo = ARGV[0]
  if (slovo == nil || slovo == "")
    abort "Для игры введите загаданное слово в качестве аргумента при запуске программы"
  end
  return slovo.split("")
end

while errors < 7 do

end

print_status(letters, good_letters, bad_letters, errors)

puts "\nВведите следующую букву"
user_input = get_user_input

result = check_result(user_input, letters, good_letters, bad_letters)