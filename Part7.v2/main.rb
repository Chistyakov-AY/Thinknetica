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
    @pass_wagons = []
    @cargo_wagons = []
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
    when "1" 
      create_station
    when "2" #create_train
      puts "Какой поезд хотите создать?
      1. Пассажирский, введите 1
      2. Грузовой, введите 2"
      num = get_command

      case num
      when "1" 
        create_pass_train
      when "2" 
        create_cargo_train
      end

    when "3" # create_route
      if @stations.size >= 2
        puts "Список созданных станций:"
        #numeration_station
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

    when "4" # add_wagons
      puts "Какой вагон вы хотите создать? 
        1. Пассажирский, введите 1
        2. Грузовой, введите 2"
      num = get_command
      
      case num
      when "1" #create_pass_wagon
        pwag = PassengerWagon.new
        @pass_wagons << pwag
        puts "Создан вагон #{pwag.type}\nВсе пассажирские вагоны: #{@pass_wagons.map(&:type)}\n\n"
      when "2" #create_cargo_wagon
        cwag = CargoWagon.new
        @cargo_wagons << cwag
        puts "Создан вагон #{cwag.type}\nВсе грузовые вагоны: #{@cargo_wagons.map(&:type)}\n\n"
      end
    end
  end

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
      create_menu
    end
    puts "Создана новая станция #{station.inspect}.\n\n"
    @stations << station
    create_menu
  end
    
  def create_pass_train
    puts "Введите номер поезда в формате: \"три буквы/цифры - две буквы/цифры\""
    attempt = 0
    begin
      number = gets.chomp
      pass_train = PassengerTrain.new(number)
    rescue RuntimeError => e
      attempt += 1
      puts e
      retry if attempt < 3
      create_menu
    end
    puts "Создан новый поезд #{pass_train.inspect}.\n\n"
    @trains << pass_train
    create_menu
  end

  def create_cargo_train
    puts "Введите номер поезда в формате: \"три буквы/цифры - две буквы/цифры\""
    begin
      attempt = 0
      number = gets.chomp
      cargo_train = CargoTrain.new(number)
    rescue RuntimeError => e
      attempt += 1
      puts e
      retry if attempt < 3
      create_menu
    end
    puts "Создан новый поезд #{cargo_train.inspect}.\n\n"
    @trains << cargo_train
    create_menu
  end

  # def passenger_train
  #   attempt = 0
  #   begin
  #     puts 'Введите название пассажирского поезда (пример ввода: "aaa-aa"):'
  #     name = gets.strip
  #     train = PassengerTrain.new(name)
  #   rescue ArgumentError => e
  #     attempt += 1
  #     puts "#{e.inspect} Ошибка!!! Попробуйте ещё раз"
  #     retry if attempt < 3
  #     create_menu
  #   end
  #   @trains << train
  #   puts 'Пассажирский поезд успешно создан'
  #   create_menu
  # end

  def action_menu
    puts "Введите 1, если вы хотите добавить или удалить станцию в маршруте"
    puts "Введите 2, если вы хотите назначить маршрут поезду"
    puts "Введите 3, если вы хотите перемещать поезд по маршруту вперед и назад"
    puts "Введите 4, если вы хотите добавить или отцепить вагон от поезда"
    puts "Введите 5, если хотите вернуться в главное меню"
    menu = gets.strip

    case menu
    when "1" #add_and_dell_stations
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
      
    when "2" # assign_train_route
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
    when "3" # to_forward_and_back_station
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

    when "4" # action_with_the_wagon
      puts "Прицепить вагон нажмите - \"1\", оцепить нажмите - \"2\""
      menu = get_command
      
      case menu
      when "1"      
        if @trains.empty?
          puts "Сначала необходимо создать поезд!\n\n"
        else
          puts "К какому поезду хотите прицепить вагон?"
          enumeration(@trains)
          name = get_command.to_i
          tr = @trains[name - 1]
          if tr.type == "pass" && !@pass_wagons.empty?
            puts "Выберите вагон, который необходимо прицепить:"
            enumeration(@pass_wagons)
            name = get_command.to_i
            wg = @pass_wagons[name - 1]
            @pass_wagons.delete(wg)
            tr.add_pass_wagon(wg)
            puts "К поезду #{tr.number} прицеплен пассажирский вагон #{wg.name}.\n\n" 
          else
            puts "Необходимо создать пассажирский вагон!\n\n"
            if tr.type == "cargo" && !@cargo_wagons.empty?
              puts "Выберите вагон, который необходимо прицепить:"
              enumeration(@cargo_wagons)
              name = get_command.to_i
              wg = @cargo_wagons[name - 1]
              @cargo_wagons.delete(wg)
              tr.add_cargo_wagon(wg)
              puts "К поезду #{tr.number} прицеплен грузовой вагон.\n\n"
            else
              puts "Необходимо создать грузовой вагон!\n\n"
            end
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
    
    when "5" # show_menu
      initial_menu
    end
  end

  def info_menu
    puts "Введите 1, если хотите просматривать список станций"
    puts "Введите 5, если хотите вернуться в главное меню"
    menu = get_command

    case menu
    when "1" # stations_view
      puts "Cписок всех станций с поездами на них:"
      enumeration(@stations)
      p_all
      puts
    when "5" # action_menu
      initial_menu
    end
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