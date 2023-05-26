class PassengerWagon
    
  attr_reader :type

  def initialize
    @type = "pass"
  end

  def name
    @type
  end
end