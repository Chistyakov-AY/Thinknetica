class Gallows
  errors = 0
  good_letters = []
  bad_letters = []
  letters = []

  def get_letters
    slovo = ARGV[0]
    if slovo.nil? 
      abort "Для игры введите загаданное слово в качестве аргумента при запуске программы"
    else 
      
    end
    return slovo.split("")
  end
