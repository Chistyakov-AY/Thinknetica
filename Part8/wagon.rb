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
    wagon_type = %w[pass cargo]
    raise 'Неправильный тип вагона' unless wagon_type.include?(type)
    raise 'Значение не должно равняться 0' if total_place.zero?
  end
end
