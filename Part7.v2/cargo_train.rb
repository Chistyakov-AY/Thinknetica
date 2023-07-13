class CargoTrain < Train
  def initialize(speed = 0)
    super
    @type = "cargo"
    validate!
  end
end
