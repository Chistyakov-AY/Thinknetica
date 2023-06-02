require "./paris.rb"
require "./rome.rb"
require "./london.rb"
location = ARGV[0]

if location == "Париж"
visit_paris(location)
  elsif location == "Рим"
    visit_rome(location)
  elsif location == "Лондон"
      visit_london(location)
else
  puts "Вы приехали не туда!"      
end
 