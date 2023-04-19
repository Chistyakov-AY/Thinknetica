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