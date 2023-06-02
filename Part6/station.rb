class Station
  include InstanceCounter

  attr_reader :trains, :name, :station

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
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

  def create_station(name)
    # puts "Введите название станции."
    # name = get_command
    # st = Station.new(name)
    # @stations << st
    # puts "Создана новая станция #{st.name}.\nCписок всех станций: #{@stations.map(&:name)}\n\n"
  end
end
