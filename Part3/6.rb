# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара
# (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением -
# вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
hash = {} #{prod: { price: 0, quantity: 0}}

while true
  puts "Введите название товара или команду 'stop' для выхода"
  name = gets.chomp
  break if name == "stop"

  puts "Введите цену товара за 1 единицу"
  price = gets.to_i
  puts "Введите кол-во купленного товара"
  quan = gets.to_i
  hash[name] = { "Цена" => price, "Количество" => quan }
end

puts hash
total =0

hash.each do |k, v|
  sum = v["Цена"] * v["Количество"]
  total += sum
  puts "Итоговая стоимость товара #{k} составляет #{sum}"
end

puts "Итоговая стоимость всех покупок составляет #{total}"
puts "Всего хорошего!"
