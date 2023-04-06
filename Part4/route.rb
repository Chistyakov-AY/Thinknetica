class Route
  attr_reader :stations # Может выводить список всех станций по-порядку от начальной до конечной
  # Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная
  # станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize (start, finish)
    @stations = [start, finish]
  end

  def add_station (name) # Может добавлять промежуточную станцию в список
    # @stations.rotate!(-1)
    # @stations << name
    # @stations.rotate!
    @stations.insert(-2, name)
  end

  def del_station (del) # Может удалять промежуточную станцию из списка
    @stations.delete(del)
    @stations
  end
end
