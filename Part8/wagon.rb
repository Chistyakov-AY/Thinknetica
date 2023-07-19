class Wagon
  include InstanceCounter
  include CompanyName
  attr_reader :type, :total_place, :used_place, :total_volume, :used_volume
  #attr_writer :total_volume, :used_volume
  
  def initialize(arg)
    register_instance
  end

  def name
    @type
  end

  def validate!
    raise "Неправильный тип вагона" unless ["pass", "cargo"].include?(type)
    raise "Значение не должно равняться 0" if @total_place == 0 || @total_volume == 0
  end



end