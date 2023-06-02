a = 172.169
b = 310.514
  if a > b
  p "Наибольшее число: #{a}"
  else
    p "Наибольшее число: " + b.to_s
  end

a = 23
b =  17
c = (a + b)/2
p "среднее: " + c.to_s

a = 35259265293
  if a % 2 == 0
    p "число четное"
  else
    p "число нечетное"
  end

time = Time.now
week_day = time.wday
p time
    if week_day <= 5
    p "Рабочий"
    else
      p "выходной"
    end

if rand(11) == 10 # рандомный выбор значения 
  puts 'Монета встала на ребро'
  else
    if rand(2) == 1
      puts 'Выпала решка'
    else
      puts 'Выпал орел'
    end
end

choice = gets.chomp
if choice == "1"
  abort "Прикурив, ребята отправились дальше"
else
  abort "Ребята расстроились и побили вас. Теперь уже ясно, за что"
end


p "Введите число 1:"
a = gets.to_i
p "Введите число 2:"
b = gets.to_i
p "Введите число 3:"
c = gets.to_i
sum = (a + b +c)/2
p "Сред ар " + sum.to_s

p "Какая у вас на руках валюта?
1. Рубли
2. Доллары"
a = gets.to_f
if a == 2
  p "Сколько сейчас стоит 1 доллар?"
  a = gets.to_f
  p "Сколько у вас долларов?"
  b = gets.to_f
  c = (a*b).round(2) #округление до 2го знака
  p "У вас " + c.to_s + " руб."
else
  p "!!!"
end

