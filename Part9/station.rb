class Station
  include InstanceCounter
  include Validation
  

  attr_reader :trains, :name, :station
  validate :name, :presence

  @@all_stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all_stations << self
    register_instance
  end

  def valid?
    validate!
  rescue
    false
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
    trains.select { |i| i.type == type }
  end

  # def trains_block(trains, &block)
  #   block.call(trains)
  # end

  def trains_each
    if self.trains.empty?
      puts "На станции нет поездов!"
    else
      self.trains.each do |value|
        puts "Номер поезда: #{value.number} || Тип поезда: #{value.type} || " \
             "Количество вагонов: #{value.wagons.length}"
        end
    end
  end

  # def trains_each
  #   trains_block(@trains) do |x|
  #     x.each do |i|
  #       puts "Номер поезда: #{i.number} || Тип поезда: #{i.type} || " \
  #            "Количество вагонов: #{i.wagons.length}"
  #     end
  #   end
  # end
end
