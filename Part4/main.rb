require_relative 'train'
require_relative 'station'
require_relative 'route'

t1 = Train2.new(1, "pas", 11)
t2 = Train2.new(2, "cargo", 22)
t3 = Train2.new(3, "pas", 33)
t4 = Train2.new(4, "cargo", 44)
s1 = Station.new("Vladik")
s2 = Station.new("Omsk")
s3 = Station.new("Moscow")
s4 = Station.new("Piter")
s5 = Station.new("Minsk")
rt = Route.new(s1, s5)
rt.add_station(s2)
rt.add_station(s3)
rt.add_station(s4)

puts "--------------"
a = t1.assign_route(rt)
puts a

p "Поезд #{t1.number} прибыл на станцию #{s1.name}"

p "Все поезда #{rt.inspect}"

p "1 - " + t1.station.inspect
p "2 - " + t1.route.stations.inspect
p "3 - " + s1.trains_by_type('pas').map {|x| x.number}.inspect
p "4 - " + s1.trains_by_type('cargo').map {|x| x.number}.inspect

t1.move_forward
t1.move_forward
t1.move_forward
t1.move_forward
t1.move_forward

t1.move_back
t1.get_station
t1.move_back
t1.get_station

p "6 - " + s3.trains_by_type('pas').map {|x| x.number}.inspect
p "7 - " + s1.trains_by_type('cargo').map {|x| x.number}.inspect
p "8 - " + t1.station.inspect

