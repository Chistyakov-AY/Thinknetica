class Train
  # Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные
  # указываются при создании экземпляра класса
  attr_accessor :speed, :number_of_wagons # Может набирать скорость, может возвращать текущую скорость и
  # может тормозить (сбрасывать скорость до нуля). Может принимать маршрут следования (объект класса Route).
  attr_reader :number, :type, :route # Может возвращать количество вагонов

  def initialize(number, type, number_of_wagons)
    @number = number
    @type = type
    @number_of_wagons = number_of_wagons
    @speed = speed
  end

  def go(km)
    speed = km
  end
  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает
  # количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def change_wagons(arg)
    if (@speed == 0) && (@number_of_wagons > 0) && (arg == "del")
      @number_of_wagons -= 1
    elsif (@speed == 0) && (arg == "add")
      @number_of_wagons += 1
    else
      puts "Остановите поезд"
    end
  end

  # Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад,
  # но только на 1 станцию за раз.
  def assign_route(rt)
    @route = rt
    @station = @route.stations[0]
    @station.add_train(self)
    @current_station_index = 0
  end

  def move_forward
    station.send_train(self)
    @current_station_index += 1 if @current_station_index < @route.stations.size-1
    station.add_train(self)
  end

  def move_back
    station.send_train(self)
    @current_station_index -= 1 if @current_station_index != 0
    station.add_train(self)
    end

  def station
    @route.stations[@current_station_index]
  end

  def get_station  # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
    puts "Предыдущая - #{@route.stations[@current_station_index - 1]&.name if @current_station_index > 0}
       Текущая - #{@route.stations[@current_station_index]&.name}
       Следующая - #{@route.stations[@current_station_index + 1]&.name}"
  end

end
