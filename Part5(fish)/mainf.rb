require_relative 'trainf'
require_relative 'train_passf'
require_relative 'train_cargof'
require_relative 'wagonf'
require_relative 'wagon_cargof'
require_relative 'wagon_passf'
require_relative 'routef'
require_relative 'stationf'

class Main

  attr_reader :stations, :trains, :routes, :route, :wagons, :wagons
  attr_accessor :active_route, :active_train, :active_wagon, :active_station

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def start
    puts "Добро пожаловать в интерактивную программу по управлению и созданию станций, поездов в и вагонов."
    puts
    loop do
      show_menu
    end
  end

  def show_menu 
    puts "Введите 1, если вы хотите создать станцию, поезд, вагон или маршрут"
    puts "Введите 2, если вы хотите произвести операции с созданными объектами"
    puts "Введите 3, если вы хотите вывести текущие данные о объектах"
    puts "Введите 0, если вы хотите закончить программу"
    menu = gets.strip
    
    case menu
    when "1"
      create_menu
    when "2"
      action_menu
    when "3"
      info_menu
    when "4"
      exit
    end
    
  end

  def create_menu
    puts "Введите 1, если хотите создать станцию"
    puts "Введите 2, если хотите создать поезд"
    puts "Введите 3, если хотите создать вагон"
    puts "Введите 4, если хотите создать маршрут"
    puts "Введите 0, если хотите вернуться в главное меню"
    menu = gets.strip

    case menu
    when "1"
      create_station
    when "2"
      create_train
    when "3"
      create_wagon
    when "4"
      create_route
    when "0"
      show_menu
    end

  end

  def create_station # создание станции
    puts "Введите имя станции: "
    name = gets.strip
    station = Station.new(name)
    @stations << station
    puts "Станция успешно создана"
    p @stations
    puts
    create_menu
  end

  def create_train # создание поезда
    puts "Какой тип поезда хотите создать?"
    puts "Введите 1, если хотите создать пассажирский поезд"
    puts "Введите 2, если хотите создать грузовой поезд"
    puts "Введите 0, если хотите вернуться в меню назад"
    menu = gets.strip

    case menu
    when "1"
      passenger_train
    when "2"
      cargo_train
    when "0"
      create_menu
    end

  end

  def passenger_train # создание пассажирского поезда
    puts "Введите название пассажирского поезда:"
    name = gets.strip
    train = PassengerTrain.new(name)
    @trains << train
    puts "Пассажирский поезд успешно создан"
    p @trains
    puts
    create_menu
  end

  def cargo_train # создание грузового поезда
    puts "Введите название грузового поезда:"
    name = gets.strip
    train = CargoTrain.new(name)
    @trains << train
    puts "Грузовой поезд успешно создан"
    p @trains
    create_menu
  end

  def create_wagon
    puts "Какой тип вагона хотите создать?"
    puts "Введите 1, если хотите создать пассажирский вагон"
    puts "Введите 2, если хотите создать грузовой вагон"
    puts "Введите 0, если хотите вернуться в меню назад"
    menu = gets.strip

    case menu
    when "1"
      passenger_wagon
    when "2"
      cargo_wagon
    when "0"
      create_menu
    end

  end

  def passenger_wagon # создание пассажирского вагона
    wagon = PassengerWagon.new
    @wagons << wagon
    puts "Пассажирский вагон успешно создан"
    p @wagons
    create_wagon
  end

  def cargo_wagon # создание грузового вагона
    wagon = CargoWagons.new
    @wagons << wagon
    puts "Грузовой вагон успешно создан"
    p @wagons
    create_wagon
  end

  def create_route # создание маршрута
    puts "Выберите начальную станцию маршрута:"
    station_listing
    station = gets.strip.to_i
    begin_station = @stations[station - 1]
    puts "Вы выбрали станцию #{begin_station.name}"
    puts "Выберите конечную станцию маршрута:"
    station_listing
    station = gets.strip.to_i
    end_station = @stations[station - 1]
    puts "Вы выбрали станцию #{end_station.name}"
    route = Route.new(begin_station, end_station)
    @routes << route
    puts "Вы успешно создали маршрут с начальной станцией #{begin_station.name} и конечной станцией #{end_station.name}"
    create_menu
  end

  def action_menu
    puts "Введите 1, если вы хотите добавить или удалить станцию в маршруте"
    puts "Введите 2, если вы хотите назначить маршрут поезду"
    puts "Введите 3, если вы хотите перемещать поезд по маршруту вперед и назад"
    puts "Введите 4, если вы хотите добавить или отцепить вагон от поезда"
    puts "Введите 0, если хотите вернуться в главное меню"
    menu = gets.strip

    case menu
    when "1"
      add_and_dell_stations
    when "2"
      assign_train_route
    when "3"
      to_forward_and_back_station
    when "4"
      action_with_the_wagon
    when "0"
      show_menu
    end

  end

  def add_and_dell_stations # добавление и удаление промежуточных станций
    puts "Выберите маршрут к которому хотите добавить или удалить станцию:"
    route_enumeration
    rout = gets.strip.to_i
    self.active_route = routes[rout - 1]
    print "Вы успешно выбрали маршрут: "
    active_route_enumeration
    puts
    loop do
      puts "Введите 1, если хотите добавить станцию в маршруте"
      puts "Введите 2, если хотите удалить станцию в маршруте"
      puts "Введите 0, назад в меню"
      menu = gets.strip

      case menu
      when "1"
        adding_station_route
      when "2"
        deleting_station_route
      when "0"
        action_menu
      end

    end
  end

  def adding_station_route # добавление станции в маршрут
    puts "Выберите станцию, которую хотите добавить:"
    station_listing
    station = gets.strip.to_i
    st = @stations[station - 1]
    self.active_route.add_station(st)
    puts "Вы успешно добавили промежуточную станцию"
    active_route_enumeration
    puts
  end

  def deleting_station_route # удаление станции из маршрута
    puts "Выберите станцию, которую хотите удалить:"
    active_route_enumeration
    station = gets.strip.to_i
    st = active_route.stations[station - 1]
    self.active_route.del_station(st)
    puts "Вы успешно удалили станцию"
    active_route_enumeration
    puts
  end

  def route_enumeration # общий список маршрутов для выбора
    @routes.each_index do |index|
      print "№ #{index + 1}. "
      rout = @routes[index]
      rout_in = rout.stations
      rout_in.each do |i|
        print "#{i.name} "
      end
      puts
    end
  end

  def assign_train_route # назначение маршрута поезду
    puts "Выберите поезд, которому хотите назначить маршрут:"
    train_enumeration
    train = gets.strip.to_i
    self.active_train = @trains[train - 1]
    puts "Вы успешно выбрали поезд #{active_train.number}"
    puts "Выберите маршрут для поезда:"
    route_enumeration
    rout = gets.strip.to_i
    self.active_route = routes[rout - 1]
    print "Выбран маршрут: "
    active_route_enumeration
    puts
    #self.active_train.new_routes(active_route)
    self.active_train.assing_route(active_route)
    puts "Маршрут успешно добавлен"
    a = active_train.route[@index_station_train = 0]
    a.add_train(active_train)
    action_menu
  end

  def to_forward_and_back_station # перемещение поезда по станциям маршрута с добавлением поезда на станции и его отправки
    puts "Выберите поезд, который хотите перемещать по выбранному маршруту:"
    train_enumeration
    train = gets.strip.to_i
    self.active_train = @trains[train - 1]
    puts "Вы успешно выбрали поезд #{active_train.number}"
    loop do
      puts "Выберите 1, если хотите переместиться по маршруту вперед"
      puts "Выберите 2, если хотите переместиться по маршруту назад"
      puts "Выберите 0, если хотите вернуться назад в меню"
      menu = gets.strip
      if menu == "1"
        self.active_train.to_forward_station(active_route)
        if active_train.route[@index_station_train + 1] == nil
        else
          a = active_train.route[@index_station_train]
          a.send_train(active_train)
          a = active_train.route[@index_station_train += 1]
          a.add_train(active_train)
        end
      elsif menu == "2"
        self.active_train.to_back_station(active_route)
        if active_train.route[@index_station_train - 1] == active_train.route[-1]
        else
          a = active_train.route[@index_station_train]
          a.send_train(active_train)
          a = active_train.route[@index_station_train -= 1]
          a.add_train(active_train)
        end
      elsif menu == "0"
        action_menu
      end
    end
  end

  def action_with_the_wagon
    puts "Выберите поезд к которому хотите добавить вагон:"
    train_enumeration
    train = gets.strip.to_i
    self.active_train = @trains[train - 1]
    puts "Вы успешно выбрали поезд #{active_train.number}"
    puts "Количество прицепленных вагонов: #{active_train.wagons.length}"
    loop do
      puts "Введите 1, если хотите добавить вагон"
      puts "Введите 2, если хотите отцепить вагон"
      puts "Введите 0, если хотите выйти в главное меню"
      menu = gets.strip

      case menu
      when "1"
        adding_a_wagon
      when "2"
        wagon_uncoupling
      when "0"
        action_menu
      end

    end
  end

  def adding_a_wagon # добавление вагона по типу к выбранному поезду
    puts "Выберите вагон который хотите добавить"
    wagon_enumeration
    selected_wagon = gets.strip.to_i
    self.active_wagon = @wagons[selected_wagon - 1]
    puts "Вы выбрали тип вагона #{active_wagon.type}"
    if active_wagon.type == active_train.type
      self.active_train.add_wagons(active_wagon)
      puts "Вагон добавлен"
      puts "Поезд: #{active_train.number}. Количество вагонов: #{active_train.wagons.length}"
    else
      puts "Тип вагона не совпадает с типом поезда, выберите другой вагон"
    end
  end

  def wagon_uncoupling # отцепляем по одному последнему вагону выбранного поезда
    self.active_train.unhook_wagons
    puts "Вагон отцеплен"
    puts "Поезд: #{active_train.number}. Количество вагонов: #{active_train.wagons.length}"
  end

  def info_menu
    puts "Введите 1, если хотите просматривать список станций"
    puts "Введите 2, если хотите просматривать список поездов на станции"
    puts "Введите 0, если хотите вернуться в главное меню"
    menu = gets.strip

    case menu
    when "1"
      station_listing
    when "2"
      list_of_trains_at_the_station
    when "0"
      action_menu
    end

  end


  def station_list # просматривать список станций
    station_listing
    info_menu
  end

  def list_of_trains_at_the_station # просматривает список поездов на выбранной станции
    puts "Выберите станцию на которой хотите посмотреть список поездов"
    station_listing
    station = gets.strip.to_i
    self.active_station = @stations[station - 1]
    puts "Выбрана станция #{active_station.name}."
    puts "Список поездов:"
    @active_station.trains.each_index do |index|
      print "№ #{index + 1}. "
      a = active_station.trains[index]
      puts "#{a.number}. Тип поезда: #{a.type}"
    end
    info_menu
  end

  protected 

=begin 
вывел в protected методы перечислений, это единственные методы в классе, которые не в принудительном порядке,
а выводятся исключительно при необходимости перечисления или дальнейшего выбора.
=end

  def station_listing # перечисление станций
    @stations.each_index do |index|
      print "№ #{index + 1}. "
      st = stations[index]
      puts "#{st.name}"
    end
  end

  def wagon_enumeration # перечисление вагонов
    @wagons.each_index do |index|
      print "№ #{index + 1}."
      a = wagons[index]
      print "Тип вагона: #{a.type}"
      puts
    end
  end

  def train_enumeration # перечисление поездов
    @trains.each_index do |index|
      print "№ #{index + 1}. "
      st = @trains[index]
      print "#{st.number}. тип поезда: #{st.type}"
      puts
    end
  end

  def active_route_enumeration # маршрут активный для изменения
    a = active_route.stations
    a.each do |index|
      print "#{index.name} "
    end
  end

end

main = Main.new
main.start