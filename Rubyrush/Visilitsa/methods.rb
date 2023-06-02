def get_word
  word = ARGV[0]

  if (word == nil || word == "")
    abort "Для игры введите загаданное слово в качестве аргумента при запуске программы"
  end

  return word.split("")
end
letters = get_word


def get_user_input
  letter = ""

  while letter == "" do
    letter = STDIN.gets.chomp
  end

  return letter
end

# 0 — пользователь отгадал букву или такая буква уже была
# 1 — пользователь отгадал букву и всё слово
# -1 — пользователь ошибся и такой буквы нет

def check_input(user_input, letters, good_letters, bad_letters)
  if good_letters.include?(user_input) || bad_letters.include?(user_input)
    return 0
  end

  if letters.include?(user_input) ||
     (user_input == 'е' && letters.include?('ё')) ||
     (user_input == 'ё' && letters.include?('е')) ||
     (user_input == 'и' && letters.include?('й')) ||
     (user_input == 'й' && letters.include?('и'))
    
    good_letters << user_input

    if user_input == 'е'
      good_letters << 'ё'
    end

    if user_input == 'ё'
      good_letters << 'е'
    end

    if user_input == 'и'
      good_letters << 'й'
    end

    if user_input == 'й'
      good_letters << 'и'
    end

    if (letters - good_letters).empty?
      return 1
    else
      return 0
    end
  else
    bad_letters << user_input
    return -1
  end
end

def print_status(letters, good_letters, bad_letters, errors)
  puts "\nСлово: " + get_word_for_print(letters, good_letters)
  puts "Ошибки (#{errors}): #{bad_letters.join(", ")}"

  if errors >= 7
    puts "Вы проиграли :("
  else
    if letters.uniq.size == good_letters.uniq.size
      puts "Поздравляем, вы выиграли!"
    else
      puts "У вас осталось попыток: " + (7 - errors).to_s
    end
  end
end

def get_word_for_print(letters, good_letters)
  result = ""

  for item in letters do
    if good_letters.include?(item)
      result += item + " "
    else
      result += "__ "
    end
  end

  return result
end

def cls
  system "clear" or system "cls"
end




