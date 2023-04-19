# require_relative 'p_train'
# require_relative 'c_train'
require_relative 'route_2'
require_relative 'station_2'
require_relative 'train_2'

# - Создавать станции
st1 = Station.new("Kras")
st2 = Station.new("Moscow")
st3 = Station.new("Odin")
p st1, st2, st3
# - Создавать поезда
ptr1 = PassengerTrain.new(1)
ctr2 = CargoTrain.new(2)
ptr3 = PassengerTrain.new(3)
ctr4 = CargoTrain.new(4)
p ptr1, ctr2, ptr3, ctr4
# - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
rt = Route.new(st1, st2)
rt.add_station(st3)
p rt
rt.del_station(st3)
p rt
# - Назначать маршрут поезду
ptr1.assign_route(rt)
p rt
# - Добавлять вагоны к поезду
ptr1.add_wagons("pas")
ptr1.add_wagons("pass")
ptr1.add_wagons("pass")
p ptr1
p "___________"
ctr2.add_wagons("ceer")
ctr2.add_wagons("cargo")
ctr2.add_wagons("cargo")
p ctr2
# - Отцеплять вагоны от поезда
ptr1.delete_wagon
p ptr1
# - Перемещать поезд по маршруту вперед и назад
ptr1.move_forward
# - Просматривать список станций и список поездов на станции
rt.stations