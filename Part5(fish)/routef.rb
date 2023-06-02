class Route # Маршрут
  attr_reader :stations

  def initialize(begin_station, end_station) # начальная и конечная станция
    @stations = [begin_station, end_station]
  end

  def add_station(station) # добавление промежуточных станций   
    stations.insert(-2, station)
  end

  def del_station(station) # удаление промежуточных станций
    stations.delete(station)
  end

  def all_stations # выводит список всех станций по порядку от начальной до конечной
    stations.each { |i| puts "#{i}" }
    stations.size
  end
end