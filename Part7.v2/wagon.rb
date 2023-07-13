class Wagon
  include InstanceCounter
  include CompanyName
  attr_reader :type
  
  def initialize
    register_instance
  end

  def name
    @type
  end

  def validate!
    raise "Неправильный тип вагона" unless ["pass", "cargo"].include?(type)
  end
end