class CargoTrain < Train
  def initialize(speed = 0)
    super
    @type = "cargo"
  end

  def add_cargo_wagon(cwag)
    @wagons << cwag
  end
end
