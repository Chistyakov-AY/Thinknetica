class CargoWagon < Wagon
  def initialize
    super
    @type = "cargo"
    validate!
  end
end