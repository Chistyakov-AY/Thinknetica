class CargoTrain < Train
  def initialize(speed = 0)
    super
    @type = "cargo"
  end

  def add_cargo_wagon(cwag)
    if (@speed == 0) && (type == "cargo")
      @wagons << cwag
    elsif (@speed == 0) && (type != "cargo")
      puts "Неверный тип вагона"
    else
      puts "Остановите поезд"
    end
  end
end
