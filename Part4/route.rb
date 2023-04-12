class Route
  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def add_station(name)
    stations.insert(-2, name)
  end

  def del_station(del)
    stations.delete(del)
    stations
  end
end
