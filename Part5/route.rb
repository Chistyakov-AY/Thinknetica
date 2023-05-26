class Route
  
  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
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
