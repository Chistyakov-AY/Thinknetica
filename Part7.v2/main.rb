require_relative 'instance_counter'
require_relative 'module_company_name'
require_relative 'station'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require './cargo_wagon.rb'

class Menu 
  attr_reader :last_command

  def initialize
    @stations = []
    @trains = []
    @wagons = []
    @routes = []
    @last_command = ''
  end

  def start
    puts "\nДобро пожаловать в интерактивную программу по управлению и созданию станций, поездов и вагонов.\n\n"
    initial_menu
  end

  def get_command
    @last_command = gets.chomp
  end

  def initial_menu
    puts "Введите 1, если вы хотите создать станцию, поезд, маршрут или вагон"
    puts "Введите 2, если вы хотите произвести операции с созданными объектами"
    puts "Введите 3, если вы хотите вывести текущие данные о объектах"
    puts "Введите 0, если вы хотите закончить программу"
    menu = get_command

    case menu
    when "1" then create_menu
    when "2" then action_menu
    when "3" then info_menu
    when "0" then exit
    end
  end

  def create_menu
    puts "Введите 1, если хотите создать станцию"
    puts "Введите 2, если хотите создать поезд"
    puts "Введите 3, если хотите создать маршрут"
    puts "Введите 4, если хотите создать вагон"
    puts "Введите 5, если хотите вернуться в главное меню"
    menu = get_command

    case menu
    when "1" then create_station
    when "2" then create_train
    when "3" then create_route
    when "4" then create_wagons
    when "5" then initial_menu
    end
  end

  def action_menu
    puts "Введите 1, если вы хотите добавить или удалить станцию в маршруте"
    puts "Введите 2, если вы хотите назначить маршрут поезду"
    puts "Введите 3, если вы хотите перемещать поезд по маршруту вперед и назад"
    puts "Введите 4, если вы хотите добавить или отцепить вагон от поезда"
    puts "Введите 5, если хотите вернуться в главное меню"
    menu = gets.strip

    case menu
    when "1" then add_and_dell_stations      
    when "2" then assign_train_route
    when "3" then to_forward_and_back_station
    when "4" then action_with_the_wagon
    when "5" then initial_menu
    end
  end

  def info_menu
    puts "Введите 1, если хотите просматривать список станций"
    puts "Введите 5, если хотите вернуться в главное меню"
    menu = get_command

    case menu
    when "1" then stations_view
    when "5" then initial_menu
    end
  end
#---------------------------------------------------------------------
  def create_station
    puts "Введите название станции."
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
    @stations << station
    initial_menu
  end
    
  def create_train
    puts "Какой поезд хотите создать?
    1. Пассажирский, введите 1
    2. Грузовой, введите 2"
    num = get_command

    case num
    when "1" 
      puts "Введите номер поезда в формате: \"три буквы/цифры - две буквы/цифры\""
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
      @trains << pass_train
      initial_menu
    when "2" 
      puts "Введите номер поезда в формате: \"три буквы/цифры - две буквы/цифры\""
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
      @trains << cargo_train
      initial_menu
    end
  end
  
  def create_route
    if @stations.size >= 2
      puts "Список созданных станций:"
      enumeration(@stations)
      puts "Введите начальную станцию маршрута"
      start = get_command.to_i
      st1 = @stations[start - 1]
      puts "Введите конечную станцию маршрута"
      finish = get_command.to_i
      st2 = @stations[finish - 1]
      @rt = Route.new(st1, st2)
      @routes << @rt
      puts "Создан новый маршрут: "
      @rt.route_name
      puts "\n\n"
    else
      puts "Для начала необходимо создать минимум 2 станции!!!\n\n"
    end
  end

  def create_wagons
    puts "Какой вагон вы хотите создать? 
      1. Пассажирский, введите 1
      2. Грузовой, введите 2"
    num = get_command
    
    case num
    when "1"
      pwag = PassengerWagon.new
      @wagons << pwag
      puts "Создан вагон #{pwag.type}\nВсе пассажирские вагоны: #{@wagons.map(&:type)}\n\n"
    when "2"
      cwag = CargoWagon.new
      @wagons << cwag
      puts "Создан вагон #{cwag.type}\nВсе грузовые вагоны: #{@wagons.map(&:type)}\n\n"
    end
  end

  def add_and_dell_stations
    puts "Добавить - 1 или удалить - 2"
    action = get_command
    
    case action
    when "1" #todo добавление станции в конкретное место и добавление из списка станций.
      if @rt == nil
        puts "Сначала необходимо создать маршрут.\n\n"
      else
        puts "Какую станцию хотите добавить в маршрут?"
        enumeration(@stations)
        num = get_command.to_i
        @rt.add_station(@stations[num - 1])
        puts "Новый маршрут:"
        @rt.route_name
        puts "\n\n"
      end
    when "2" 
      if @rt == nil
        puts "Сначала необходимо создать маршрут.\n\n"
      else 
        if @rt.stations.size <= 2
          puts "В маршруте не может быть меньше 2ух станций!\n\n"
        else
          puts "Какую станцию Вы хотите удалить из маршрута?"
          enumeration(@rt.stations)
          num = get_command.to_i
          @rt.del_station(@rt.stations[num - 1])
          puts "Новый маршрут:"
          @rt.route_name
          puts "\n\n"
        end
      end
    end  
  end   

  def assign_train_route
    if @rt == nil
      puts "Необхоимо создать маршрут!\n\n"
    else
      puts "Какой поезд хотите назначить на маршрут?"
      enumeration(@trains)
      name = get_command.to_i
      tr = @trains[name - 1]
      tr.assign_route(@rt)
      puts "Поезд #{tr.number}\n\n"
      puts "На какую станцию назначить поезд?"
      enumeration(@rt.stations)
      name = get_command.to_i
      st = @rt.stations[name - 1]
      st.trains << tr
      puts "\nПоезд #{tr.name} назначен на маршрут #{@rt}\n\n"
    end
  end

  def to_forward_and_back_station
    puts "Какой поезд необходимо переместить?"
    enumeration(@trains)
    name = get_command.to_i
    tr = @trains[name - 1]
    puts "Для перемещения вы выбрали поезд #{tr.number}\n\n"
    puts "Выберите 1, если хотите переместиться по маршруту вперед"
    puts "Выберите 2, если хотите переместиться по маршруту назад"
    puts "Выберите 0, если хотите вернуться назад в меню"
    name = get_command.chomp
    
    case name
    when "1"
      tr.move_forward
      puts "Поезд на новой станции. Маршрут #{@rt.name}.\n\n"
    when "2"
      tr.move_back
      puts "Поезд на новой станции. Маршрут #{@rt.name}.\n\n"
    end
  end

  def action_with_the_wagon
    puts "Прицепить вагон нажмите - \"1\", оцепить нажмите - \"2\""
    menu = get_command
    
    case menu
    when "1"      
      if @trains.empty? || @wagons.empty?
        puts "Сначала необходимо создать обьекты!\n\n"
      else
        puts "К какому поезду хотите прицепить вагон?"
        enumeration(@trains)
        name = get_command.to_i
        tr = @trains[name - 1]
        puts "Выберите вагон, который необходимо прицепить:"
        enumeration(@wagons)
        name = get_command.to_i
        wg = @wagons[name - 1]
        if wg.type == tr.type
          tr.add_wagon(wg)
          @wagons.delete(wg)
          puts "К поезду #{tr.number} прицеплен пассажирский вагон #{wg.inspect}.\n\n" 
        else
          puts "Вагон не соответствует типу поезда!\n\n"
          initial_menu
        end
      end

    when "2"
      puts "От какого поезда хотите отцепить вагон?"
      enumeration(@trains)
      name = get_command.to_i
      tr = @trains[name - 1]
      if tr.wagons.empty? 
        puts "У поезда #{tr.number} нет прицепленных вагонов.\n\n"
      else   
        tr.del_wagon
        puts "У поезда #{tr.number} удален вагон.\n\n" 
      end  
    end
  end

  def stations_view
    puts "Cписок всех станций с поездами на них:"
    enumeration(@stations)
    p @stations
    puts
  end

  private

  def enumeration(name)
    name.each_index do |index|
    print "№ #{index + 1} - "
    st = name[index]
    puts "#{st}"
    end
  end  
end

menu = Menu.new
menu.start

while menu.last_command != '0' || menu.last_command == '5'
  menu.initial_menu
end
puts 'bye'