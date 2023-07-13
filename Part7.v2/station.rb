class Station
  include InstanceCounter

  attr_reader :trains, :name, :station

  @@all_stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all_stations << self
    register_instance
  end

  def validate!
    raise "Название станции не может быть пустым" if name == ""
  end

  def self.all
    @@all_stations
  end
  
  def add_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select {|i| i.type == type}
  end
end