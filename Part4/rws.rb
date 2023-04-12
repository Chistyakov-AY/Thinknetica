require_relative 'train'
require_relative 'station'
require_relative 'route'

t1 = Train.new(1, "pas", 11)
t2 = Train.new(2, "cargo", 22)
t3 = Train.new(3, "pas", 33)
t4 = Train.new(4, "cargo", 44)
s1 = Station.new("Vladik") #Имеет название, которое указывается при ее создании
s2 = Station.new("Omsk")
s3 = Station.new("Moscow")
s4 = Station.new("Piter")
s5 = Station.new("Minsk")
rt = Route.new(s1, s5)
rt.add_station(s2)
rt.add_station(s3)
rt.add_station(s4)
t1.assign_route(rt)


# s2.add_train(t2)
# s3.add_train(t3)
# s4.add_train(t4)
# s1.add_train(t1) #Может принимать поезда (по одному за раз)
p "Поезд #{t1.number} прибыл на станцию #{s1.name}"

p "Все поезда #{rt.inspect}" #Может возвращать список всех поездов на станции, находящиеся в текущий момент

          #Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских

#rt.del_station(s4)   #Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

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
# puts t.station
