#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

#hash = {}
alpha = {а: 1, б: 2, в: 3, г: 4, д: 5, е: 6, ж: 7, з: 8, и: 9, к: 10, л: 11, м: 12, о: 13}

hash = alpha.select! {|x, y| [:а, :е, :и, :о].include? (x)}
print hash
