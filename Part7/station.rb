class Station
  include InstanceCounter

  attr_reader :trains, :name, :station

  @@all_stations = []

  def initialize
    get_name
    @trains = []
    @@all_stations << self
    register_instance
  end

  def get_name
    puts "Введите название станции."
    name = gets.chomp
    validate(name)
    puts "Создан новая станция #{@name}.\n\n"
  end

  def valid?(name)
    raise "Название станции не может быть пустым" if name == ""
  end

  def validate(name)
    valid?(name)
    @name = name
  rescue RuntimeError => e
    puts e.message
    validate(gets.chomp) 
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
