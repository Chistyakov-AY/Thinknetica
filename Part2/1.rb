puts "Введите Ваше имя"
name = gets.chomp.capitalize # можно задать вторую переменную и применить метод .capitalize
puts "Укажите Ваш рост"
height = gets
weight = (height.to_i - 110)*1.15
#weight1 = weight.to_i
if weight >= 0
  puts "#{name}, Ваш идеальный вес #{weight.to_i}кг. Спасибо!!!"
  else
  puts "#{name}, Ваш вес уже оптимальный"
  end