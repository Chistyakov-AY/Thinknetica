require_relative 'game'
require_relative 'result_printer'
printer = ResultPrinter.new
puts "Игра виселица. Версия 2. (с) rubyrush.ru\n\n"
slovo = ARGV[0]
game = Game.new(slovo)
while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end
printer.print_status(game)
