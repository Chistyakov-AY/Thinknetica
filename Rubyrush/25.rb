arr = ["Toyota","BMW","Lada","KIA","H","OKA","Lexus","Ford"]
p "У нас всего 8 машин. Вам какую?"
ch = gets.to_i
if
ch > (arr.size.to_i) || ch < 0
  p "Извините, машины с таким номером у нас нет. У нас всего 8 машин."
else
  p "Ваша машина - #{arr[ch-1]}"
end