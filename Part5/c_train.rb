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
