class Train
  include CompanyName
  include InstanceCounter
  
  attr_accessor :speed, :type
  attr_reader :number, :route, :wagons

  NUMBER_FORMAT = /^\w{3}(-|)\w{2}$/i

  class << self
    @@all_trains = []

    def all_trains
      @@all_trains
    end

    def find(number)
      @@all_trains.select {|index| index.number == "#{number}"}
    end
  end

  def initialize(number, speed = 0)
    @number = number
    validate!(number)
    @speed = speed
    @type = type
    @wagons = []
    self.class.all_trains << self
    register_instance
  end

  def validate!(number)
    raise "Номер поезда не может быть пустым" if number == ""
    raise "Неправильный формат номера поезда" if number !~ NUMBER_FORMAT
    number
  end

  def add_wagons(type)
    add_wagon(type)
    end

  def delete_wagon
    del_wagon
  end

  def assign_route(route)
    @route = route
    @station = @route.stations[0]
    @station.add_train(self)
    @current_station_index = 0
  end

  def move_forward
    station.send_train(self)
    @current_station_index += 1 if @current_station_index < @route.stations.size - 1
    station.add_train(self)
  end

  def move_back
    station.send_train(self)
    @current_station_index -= 1 if @current_station_index != 0
    station.add_train(self)
  end

  def station
    @route.stations[@current_station_index]
  end

  def get_station
    puts "Предыдущая - #{@route.stations[@current_station_index - 1]&.name if @current_station_index > 0}
    Текущая - #{@route.stations[@current_station_index]&.name}
    Следующая - #{@route.stations[@current_station_index + 1]&.name}"
  end

  def del_wagon
    @wagons.delete_at(-1)
  end

  def name
    @number
  end
end




