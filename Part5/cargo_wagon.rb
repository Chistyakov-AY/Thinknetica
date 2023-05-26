class CargoWagon
  
  attr_reader :type
    
  def initialize
    @type = "cargo"
  end

  def name
    @type
  end
end