class Train

  attr_accessor :speed
  attr_reader :number, :type, :route

  def add_wagons(type)
    add_wagon(type)
  end

  def delete_wagon
    del_wagon
  end

  def assign_route(route)
    @route = route
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

  def get_station
    puts "Предыдущая - #{@route.stations[@current_station_index - 1]&.name if @current_station_index > 0}
       Текущая - #{@route.stations[@current_station_index]&.name}
       Следующая - #{@route.stations[@current_station_index + 1]&.name}"
  end

  private

  def del_wagon
    @wagons.delete_at(-1)
  end

end

class PassengerTrain < Train

  def initialize(number, speed = 0, type = "pass")
    @number = number
    @speed = speed
    @type = type
    @wagons = []
  end


  def add_wagon(type)
    if (@speed == 0) && (type == "pass")
        @wagons << type
    elsif (@speed == 0) && (type != "pass")
        puts "Неверный тип вагона"
    else
        puts "Остановите поезд"
    end
  end

end

class CargoTrain < Train
  def initialize(number, speed = 0, type = "cargo")
    @number = number
    @speed = speed
    @type = type
    @wagons = []
  end

  def add_wagon(type)
    if (@speed == 0) && (type == "cargo")
      @wagons << type
    elsif (@speed == 0) && (type != "cargo")
      puts "Неверный тип вагона"
    else
      puts "Остановите поезд"
    end
  end
end

