require_relative 'train'
require_relative 'station'
require_relative 'route'

t = Train.new(1, "pas", 5)
s1 = Station.new("Moscow")
s2 = Station.new("Simferopol")
s3 = Station.new("Odin")
s4 = Station.new("Kras")
r = Route.new(s1, s2)
r.add_station(s3)
r.add_station(s4)
t.route = r
p "1 - " + t.station.inspect
p "2 - " + t.route.stations.inspect
p "3 - " + s1.list_trains('pas')
p "4 - " + s1.list_trains('cargo')
p "5 - " + t.station.inspect
t.get_station
t.move_forward
t.move_forward
t.move_forward
t.move_forward
t.move_forward
t.get_station

t.move_back
t.move_back
t.get_station

p "6 - " + s1.list_trains('pas')
p "7 - " + s1.list_trains('cargo')
p "8 - " + t.station.inspect
# puts t.station
