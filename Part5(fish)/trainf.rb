class Train # Поезд
  attr_accessor :wagons, :speed
  attr_reader :number, :type, :route

  def initialize(number, speed = 0)
    @speed = speed
    @number = number
    @type = type
    @wagons = []
  end

  def go(km) # устанавливаем скорость поезда
    self.speed = km
  end

  def stop # останавливаем поезд
    self.speed = 0
  end

  def prev_station # возвращает предыдущую станцию
    if @route[@current_station_index - 1] == @route[-1]
    else
      @route[@current_station_index - 1]
    end
  end

  def current_station # возвращаем текущую станцию
    @route[@current_station_index]
  end

  def next_station # возвращаем следующую станцию
    if @route[@current_station_index + 1] == nil
    else
      @route[@current_station_index + 1]
    end
  end

  def assing_route(route) # добавляем маршрут из класса Route и помещаем поезд на первую станцию маршрута
    @route = route.stations
    @current_station_index = 0
    a = route.stations[@current_station_index]
    puts "Начало маршрута со станции #{a.name}"
  end
  
  def to_forward_station(route) # перемещаем поезд вперед на одну станцию
    @current_station_index += 1 if next_station
    puts "Вперед на одну станцию"
  end

  def to_back_station(route) # перемещаем поезд на одну станцию назад
    @current_station_index -= 1 if prev_station
    puts "Назад на одну станцию"
  end

  def add_wagons(wagon) # добавляем вагон при скорости поезда 0
    if @speed == 0 && @type == wagon.type
      @wagons << wagon
    end
  end

  def unhook_wagons # отцепляем вагон при скорости поезда 0
    if @speed == 0
      @wagons.delete_at(-1)
    end
  end

end