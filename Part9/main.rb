require_relative 'instance_counter'
require_relative 'module_company_name'
require_relative 'module_acсessors'
require_relative 'module_validation'
require_relative 'station'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'

class Menu
  extend Acсessors

  def initialize
    @stations = []
    @trains = []
    @wagons = []
    @routes = []
    @last_command = ''
  end

  attr_accessor_with_history :last_command, :wagons, :trains, :stations, :routes, :rt

  def start
    puts "\nДобро пожаловать в программу по управлению и созданию станций, поездов и вагонов.\n\n"
    initial_menu
  end

  def accept_command
    @last_command = gets.chomp
  end

  def initial_menu
    puts 'Введите 1, если вы хотите создать станцию, поезд, маршрут или вагон'
    puts 'Введите 2, если вы хотите произвести операции с созданными объектами'
    puts 'Введите 3, если вы хотите вывести текущие данные о объектах'
    puts 'Введите 4, СОЗДАНИЕ ТЕСТОВЫХ ДАННЫХ (станций, поездов, вагонов)'
    puts 'Введите 0, если вы хотите закончить программу'
    menu = accept_command

    case menu
    when '1' then create_menu
    when '2' then action_menu
    when '3' then info_menu
    when '4' then create_all_object
    when '0' then exit
    end
  end

  def create_menu
    puts 'Введите 1, если хотите создать станцию'
    puts 'Введите 2, если хотите создать поезд'
    puts 'Введите 3, если хотите создать маршрут'
    puts 'Введите 4, если хотите создать вагон'
    puts 'Введите 5, если хотите вернуться в главное меню'
    menu = accept_command

    case menu
    when '1' then create_station
    when '2' then create_train
    when '3' then create_route
    when '4' then create_wagons
    when '5' then initial_menu
    end
  end

  def action_menu
    puts 'Введите 1, если вы хотите добавить или удалить станцию в маршруте'
    puts 'Введите 2, если вы хотите назначить маршрут поезду'
    puts 'Введите 3, если вы хотите перемещать поезд по маршруту вперед и назад'
    puts 'Введите 4, если вы хотите добавить или отцепить вагон от поезда'
    puts 'Введите 5, если вы хотите занять место или изменить объем в вагона'
    puts 'Введите 6, если хотите вернуться в главное меню'
    menu = gets.strip

    case menu
    when '1' then add_and_del_stations
    when '2' then assign_train_route
    when '3' then to_forward_and_back_station
    when '4' then action_with_the_wagon
    when '5' then seats_and_volume_in_the_wagon
    when '6' then initial_menu
    end
  end

  def info_menu
    puts 'Введите 1, если хотите просматривать список станций'
    puts 'Введите 2, если хотите просматривать список поездов на станции'
    puts 'Введите 3, если хотите просматривать список вагонов у выбранного поезда'
    puts 'Введите 5, если хотите вернуться в главное меню'
    menu = accept_command

    case menu
    when '1' then stations_view
    when '2' then show_trains_at_the_station
    when '3' then show_wagons_at_the_train
    when '5' then initial_menu
    end
  end

  #---------------------------------------------------------------------
  def create_all_object # rubocop:disable Metrics/AbcSize
    puts 'Созданные станции:'
    2.times { |x| stations << Station.new(x + 1) }
    enumeration(stations)
    puts 'Созданные поезда:'
    type_pass = { pass: 'pas-11', cargo: 'car-11' }
    create_train_by_type(type_pass)
    enumeration(trains)
    puts 'Созданные вагоны:'
    create_test_wagons
    enumeration(wagons)
    puts 'Создан новый машрут:'
    rt = Route.new(stations[0], stations[1])
    routes << rt
    rt.route_name
    puts 'К поездам прицеплены все вагоны:'
    trains[0].add_wagon(wagons[0..1])
    trains[1].add_wagon(wagons[2..3])
    enumeration(trains)
    puts 'Все поезда назначены на станции:'
    stations[0].trains << trains[0..1]
    stations[1].trains << trains[2..3]
    enumeration(stations)
    puts
    initial_menu
  end

  def create_train_by_type(hash)
    hash.each do |key, value|
      trains << if key == :pass
                  PassengerTrain.new(value)
                else
                  CargoTrain.new(value)
                end
    end
  end

  def create_test_wagons
    2.times { |x| wagons << PassengerWagon.new((x + 1) * 10) }
    2.times { |x| wagons << CargoWagon.new((x + 1) * 100) }
  end

  def create_station
    puts 'Введите название станции.'
    attempt = 0
    begin
      name = gets.chomp
      station = Station.new(name)
    rescue RuntimeError => e
      attempt += 1
      puts e
      retry if attempt < 3
      initial_menu
    end
    puts "Создана новая станция #{station.inspect}.\n\n"
    stations << station
    initial_menu
  end

  def create_train
    puts "Какой поезд хотите создать?
    1. Пассажирский, введите 1
    2. Грузовой, введите 2"
    num = accept_command

    case num
    when '1' then create_pass_train
    when '2' then create_cargo_train
    end
  end

  def create_pass_train
    puts 'Введите номер поезда в формате: "три буквы/цифры - две буквы/цифры"'
    attempt = 0
    begin
      number = gets.chomp
      pass_train = PassengerTrain.new(number)
    rescue RuntimeError => e
      attempt += 1
      puts e
      retry if attempt < 3
      initial_menu
    end
    puts "Создан новый поезд #{pass_train.inspect}.\n\n"
    trains << pass_train
    initial_menu
  end

  def create_cargo_train
    puts 'Введите номер поезда в формате: "три буквы/цифры - две буквы/цифры"'
    begin
      attempt = 0
      number = gets.chomp
      cargo_train = CargoTrain.new(number)
    rescue RuntimeError => e
      attempt += 1
      puts e
      retry if attempt < 3
      initial_menu
    end
    puts "Создан новый поезд #{cargo_train.inspect}.\n\n"
    trains << cargo_train
    initial_menu
  end

  def create_route # rubocop:disable Metrics/AbcSize
    if stations.size >= 2
      puts 'Список созданных станций:'
      enumeration(stations)
      puts 'Введите начальную станцию маршрута'
      start = accept_command.to_i
      st1 = stations[start - 1]
      puts 'Введите конечную станцию маршрута'
      finish = accept_command.to_i
      st2 = stations[finish - 1]
      rt = Route.new(st1, st2)
      routes << rt
      puts 'Создан новый маршрут: '
      rt.route_name
      puts "\n\n"
    else
      puts "Для начала необходимо создать минимум 2 станции!!!\n\n"
    end
  end

  def create_wagons
    puts "Какой вагон вы хотите создать?
      1. Пассажирский, введите 1
      2. Грузовой, введите 2"
    num = accept_command

    case num
    when '1' then create_pass_wagon
    when '2' then create_cargo_wagon
    end
  end

  def create_pass_wagon
    puts 'Какое кол-во мест в вагоне?'
    attempt = 0
    begin
      total_place = gets.chomp.to_i
      pwag = PassengerWagon.new(total_place)
    rescue RuntimeError => e
      attempt += 1
      puts e
      retry if attempt < 3
      initial_menu
    end
    wagons << pwag
    puts "Создан пассажирский вагон #{pwag.inspect}\nВсе вагоны:\n"
    enumeration(wagons)
    puts
  end

  def create_cargo_wagon
    puts 'Какое объем вагона?'
    attempt = 0
    begin
      total_place = gets.chomp.to_i
      cwag = CargoWagon.new(total_place)
    rescue RuntimeError => e
      attempt += 1
      puts e
      retry if attempt < 3
      initial_menu
    end
    wagons << cwag
    puts "Создан грузовой вагон #{cwag.inspect}\nВсе вагоны:\n"
    enumeration(wagons)
    puts
  end

  def add_and_del_stations
    puts 'Добавить - 1 или удалить - 2'
    action = accept_command

    case action
    when '1' then add_stations
    when '2' then puts(del_stations)
    end
  end

  def add_stations # rubocop:disable Metrics/AbcSize
    if rt.nil?
      puts "Сначала необходимо создать маршрут.\n\n"
    else
      puts 'Какую станцию хотите добавить в маршрут?'
      enumeration(stations)
      num = accept_command.to_i
      rt.add_station(stations[num - 1])
      puts 'Новый маршрут:'
      rt.route_name
      puts "\n\n"
    end
  end

  def del_stations
    if rt.nil?
      "Сначала необходимо создать маршрут.\n\n"
    elsif rt.stations.size <= 2
      "В маршруте не может быть меньше 2ух станций!\n\n"
    else
      puts 'Какую станцию Вы хотите удалить из маршрута?'
      new_route
    end
  end

  def new_route
    enumeration(rt.stations)
    num = accept_command.to_i
    rt.del_station(rt.stations[num - 1])
    "Новый маршрут: #{rt.route_name}\n\n"
  end

  def assign_train_route # rubocop:disable Metrics/AbcSize
    if rt.nil?
      puts "Необхоимо создать маршрут!\n\n"
    else
      puts 'Какой поезд хотите назначить на маршрут?'
      enumeration(trains)
      name = accept_command.to_i
      tr = trains[name - 1]
      tr.assign_route(rt)
      puts "Поезд #{tr.number}\n\n"
      puts 'На какую станцию назначить поезд?'
      enumeration(rt.stations)
      name = accept_command.to_i
      st = rt.stations[name - 1]
      st.trains << tr
      puts "\nПоезд #{tr.number} назначен на маршрут #{rt}\n\n"
    end
  end

  def to_forward_and_back_station # rubocop:disable Metrics/AbcSize
    puts 'Какой поезд необходимо переместить?'
    enumeration(trains)
    name = accept_command.to_i
    tr = trains[name - 1]
    puts "Для перемещения вы выбрали поезд #{tr.number}\n\n"
    puts 'Выберите 1, если хотите переместиться по маршруту вперед'
    puts 'Выберите 2, если хотите переместиться по маршруту назад'
    puts 'Выберите 0, если хотите вернуться назад в меню'
    name = accept_command.chomp

    case name
    when '1'
      tr.move_forward
      puts "Поезд на новой станции. Маршрут #{rt.name}.\n\n"
    when '2'
      tr.move_back
      puts "Поезд на новой станции. Маршрут #{rt.name}.\n\n"
    end
  end

  def action_with_the_wagon
    puts 'Прицепить вагон нажмите - "1", оцепить нажмите - "2"'
    menu = accept_command

    case menu
    when '1' then attach_the_wagon
    when '2' then unhook_the_wagon
    end
  end

  def attach_the_wagon # rubocop:disable Metrics/AbcSize
    if trains.empty? || wagons.empty?
      puts "Сначала необходимо создать обьекты!\n\n"
    else
      puts 'К какому поезду хотите прицепить вагон?'
      enumeration(trains)
      name = accept_command.to_i
      tr = trains[name - 1]
      puts 'Выберите вагон, который необходимо прицепить:'
      enumeration(wagons)
      name = accept_command.to_i
      wg = wagons[name - 1]
      if wg.type == tr.type
        tr.add_wagon(wg)
        wagons.delete(wg)
        puts "К поезду #{tr.number} прицеплен пассажирский вагон #{wg.inspect}.\n\n"
      else
        puts "Вагон не соответствует типу поезда!\n\n"
        initial_menu
      end
    end
  end

  def unhook_the_wagon
    puts 'От какого поезда хотите отцепить вагон?'
    enumeration(trains)
    name = accept_command.to_i
    tr = trains[name - 1]
    if tr.wagons.empty?
      puts "У поезда #{tr.number} нет прицепленных вагонов.\n\n"
    else
      tr.del_wagon
      puts "У поезда #{tr.number} удален вагон.\n\n"
    end
  end

  def seats_and_volume_in_the_wagon
    if wagons.empty?
      puts "Сначала необходимо создать вагон(ы)!\n\n"
      initial_menu
    else
      puts 'Если хотите занять место, нажмите - "1", изменить объем вагона, нажмите - "2.'
      num = accept_command
    end

    case num
    when '1' then take_the_place
    when '2' then take_up_volume
    end
  end

  def take_the_place
    puts 'Выберите вагон, в котором хотите занять место:'
    enumeration(wagons)
    wagon = wagons[accept_command.to_i - 1]
    if wagon.type == 'pass'
      wagon.take_place
      puts "В вагоне свобдных мест - #{wagon.free_place}, занятых - #{wagon.used_place}\n\n"
      initial_menu
    else
      puts "У вагона нет пассажирских мест\n\n"
    end
  end

  def take_up_volume # rubocop:disable Metrics/AbcSize
    puts 'Выберите вагон, в котором хотите занять объем:'
    enumeration(wagons)
    wagon = wagons[accept_command.to_i - 1]
    if wagon.type == 'cargo'
      puts 'Какой объем хотите занять?'
      volume = gets.chomp.to_i
      wagon.take_place(volume)
      puts "В вагоне свободный объем - #{wagon.free_place}, занятый объем - #{wagon.used_place}\n\n"
      initial_menu
    else
      puts "Это не грузовой вагон!\n\n"
    end
  end

  def stations_view
    puts 'Cписок всех станций с поездами на них:'
    enumeration(stations)
    puts
  end

  def show_trains_at_the_station
    puts 'На какой станции хотите просмотреть список поездов?'
    enumeration(stations)
    station = gets.chomp.to_i
    selected_station = stations[station - 1]
    puts "Вы выбрали станцию: #{selected_station.name}.\n\n"
    puts 'Список поездов:'
    selected_station.trains_each
    puts
    initial_menu
  end

  def show_wagons_at_the_train
    puts 'У какого поезда хотите посмотреть список вагонов'
    enumeration(trains)
    train = gets.chomp.to_i
    selected_train = trains[train - 1]
    puts "Вы выбрали поезд: #{selected_train.number}"
    selected_train.wagon_each
    puts
    initial_menu
  end

  private

  def enumeration(name)
    name.each_index do |index|
      print "№ #{index + 1} - "
    st = name[index]
    puts st.inspect
    end
  end
end

menu = Menu.new
menu.start

menu.initial_menu while menu.last_command != '0' || menu.last_command == '5'
puts 'bye'
