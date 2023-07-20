class Wagon
  include InstanceCounter
  include CompanyName
  attr_reader :type, :total_place, :used_place
  
  def initialize(total_place)
    @total_place = total_place
    @used_place = 0
    validate!
    register_instance
  end

  def free_place
    total_place - used_place
  end

  def validate!
    raise "Неправильный тип вагона" unless ["pass", "cargo"].include?(type)
    raise "Значение не должно равняться 0" if total_place == 0
  end
end