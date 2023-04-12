class Station
  attr_reader :trains, :name, :station

  def initialize (name)
    @name = name
    @trains = []
  end

    def add_train(train) # Может принимать поезда (по одному за раз).
      trains << train
    end

    def send_train(train) # Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
      trains.delete(train)
    end

    def trains_by_type(type)  # Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
      trains.select {|i| i.type == type}
    end

end
