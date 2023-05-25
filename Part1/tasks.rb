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

if rand(2) == 1
  puts 'Выпала решка'
else
  puts 'Выпал орел'
end