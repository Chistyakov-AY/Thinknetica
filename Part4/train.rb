class Train
  # Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные
  # указываются при создании экземпляра класса
  attr_accessor :speed # Может набирать скорость, может возвращать текущую скорость и
  # может тормозить (сбрасывать скорость до нуля). Может принимать маршрут следования (объект класса Route).
  attr_reader :number_of_train, :type_of_train, :number_of_wagons, :route, :station # Может возвращать количество вагонов

  def initialize (number_of_train, type_of_train, number_of_wagons)
    @number_of_train = number_of_train
    @type_of_train = type_of_train
    @number_of_wagons = number_of_wagons
    @speed = speed
    @station = nil
  end

  def route=(route) # При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
    @station = route.stations.first
    @station.add_train(self)
    @route = route
  end
  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает
  # количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def add_del(arg)
    if (@speed == 0) && (@number_of_wagons > 0) && (arg == "del")
      @number_of_wagons -= 1
    elsif (@speed == 0) && (arg == "add")
      @number_of_wagons += 1
    else
      puts "Остановите поезд"
    end
  end

  def move_forward # Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад,
    # но только на 1 станцию за раз.
    index = @route.stations.index @station
    s = @route.stations[index + 1]
    if s
      @station.send_train(self)
      @station = s
    end
  end

  def move_back # Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад,
    # но только на 1 станцию за раз.
    index = @route.stations.index @station
    s = @route.stations[index - 1]
    if s
      @station.send_train(self)
      @station = s
    end
  end

  def get_station  # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
    index = @route.stations.index @station
    puts "Предыдущая - #{@route.stations[index - 1]&.station_name if index > 0}
       Текущая - #{@route.stations[index]&.station_name}
       Следующая - #{@route.stations[index + 1]&.station_name}"
  end


end
