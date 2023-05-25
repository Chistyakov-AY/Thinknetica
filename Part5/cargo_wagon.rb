class CargoWagon
  attr_reader :type
    
  def initialize
    @type = "cargo"
    end

  def add_cargo_wagon(cwag)
    @wagons << cwag
  end
end