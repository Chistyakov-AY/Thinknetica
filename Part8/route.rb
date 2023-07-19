class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
    validate!
    register_instance
  end

  def validate!
    raise "Тип обьекта не является экземляром класса Station" unless @stations.all? {|s| s.class == Station} 
  end

  def add_station(st)
    stations.insert(-2, st)
  end

  def del_station(st)
    stations.delete(st)
  end

  def name
    "#{stations[0].name}-#{stations[-1].name}"
  end

  def route_name
    stations.each_index do |index|
      print " - #{stations[index].name} - "
    end
  end
end
