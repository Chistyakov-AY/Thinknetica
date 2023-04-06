class Station
  attr_reader :trains_in_station, :station_name # Может возвращать список всех поездов на станции, находящиеся в текущий момент
  def initialize (station_name) # Имеет название, которое указывается при ее создании
    @station_name = station_name
    @trains_in_station = {}
  end

  def add_train(train) # Может принимать поезда (по одному за раз).
    @trains_in_station[train.number_of_train] = train.type_of_train
    puts "#{train.type_of_train} Поезд №#{train.number_of_train} прибыл на станцию #{@station_name}!"
  end

  def send_train(train) # Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
    @trains_in_station.delete(train.number_of_train)
    puts "Поезд #{train.number_of_train} отправлен со станции #{@station_name}!"
  end

  def list_trains(name) # Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
    # puts "Грузовые (cargo) или пассажирские (pas)"
    # name = gets.chomp
    hash = @trains_in_station.select {|k, v| name.include?(v)}
    # puts hash
    "Кол-во поездов #{name} #{hash.size}"
  end

end
