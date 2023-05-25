require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class Menu #todo красивый вывод значений

  attr_reader :last_command, :stations, :name, :trains, :type

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
    when "1" # create_station # todo выводить красиво, только названия и "такая станция уже есть" и убрать пустой ввод
      puts "Введите название станции."
      name = get_command
      st = Station.new(name)
      @stations << st
      puts "Создана новая станция #{st.inspect}.\nCписок всех станций: #{@stations}\n\n"
    when "2" #create_train
      puts "Какой поезд хотите создать?
      1. Пассажирский, введите 1
      2. Грузовой, введите 2 "
      num = get_command

      case num
      when "1"
        puts "Введите номер поезда"
        name = get_command
        @ptr = PassengerTrain.new(name)
        @trains << @ptr
        puts "Создан новый пассажирский поезд #{@ptr.inspect}.\nВсе поезда #{@trains}\n\n"             
      when "2"
        puts "Введите номер поезда"
        name = get_command
        @ctr = CargoTrain.new(name)
        @trains << @ctr
        puts "Создан новый грузовой поезд #{@ctr.inspect}.\nВсе поезда #{@trains}\n\n"
      end
    when "3" # create_route #todo создание нескольких маршрутов
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
      puts "Создан новый маршрут: #{@rt.stations.inspect}\n\n" #todo вывод станций в маршруте через ->
      else
        puts "Для начала необходимо создать минимум 2 станции!!!\n\n"
      end
    when "4" # add_wagons
      puts "Какой вагон вы хотите создать? 
        1. Пассажирский, введите 1
        2. Грузовой, введите 2"
      num = get_command
      
      case num
      when "1"
        pwag = PassengerWagon.new
        @pass_wagons << pwag
        puts "Создан пассажирский вагон #{pwag.inspect}\nВсе пассажирские вагоны: #{@pass_wagons}\n\n"
      when "2"
        cwag = CargoWagon.new
        @cargo_wagons << cwag
        puts "Создан грузовой вагон #{cwag.inspect}\nВсе грузовые вагоны: #{@cargo_wagons}\n\n"
      end
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
    when "1" #add_and_dell_stations
      puts "Добавить - 1 или удалить - 2"
      action = get_command
      
      case action
      when "1" #todo добавление станции в конкретное место и добавление из списка станций.
        if @rt == nil
          puts "Сначала необходимо создать маршрут.\n\n"
        else
          puts "Введите название новой станции"
          name = get_command
          st = Station.new(name)
          @rt.add_station(st)
          puts "В маршрут #{@rt.inspect} добавлена станция #{st.inspect}\n\n"
        end       
      when "2" 
        if @rt == nil
          puts "Сначала необходимо создать маршрут.\n\n"
        else 
          if @rt.stations.size <= 2
            puts "В маршруте не может быть меньше 2ух станций!\n\n"
          else
            puts "Какую станцию Вы хотите удалить из маршрута?"
            #stations_in_route
            enumeration(@rt.stations)
            name = get_command.to_i
            @rt.stations.delete(@rt.stations[name - 1])
            puts "Новый маршрут: #{@rt.inspect}"
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
      puts "Поезд #{tr.inspect}\n\n"
      puts "На какую станцию назначить поезд?"
      enumeration(@rt.stations)
      name = get_command.to_i
      st = @rt.stations[name - 1]
      st.trains << tr
      puts "Поезд #{tr.inspect} назначен на маршрут #{@rt.inspect}\n\n"
      end
    # when "3" # to_forward_and_back_station
    #   puts "Какой поезд необходимо переместить?"
    #   enumeration(@trains)
    #   name = get_command.to_i
    #   tr = @trains[name - 1]
    #   leng = name
    #   puts "Для перемещения вы выбрали поезд #{tr.inspect}\n\n"
    #   puts "Выберите 1, если хотите переместиться по маршруту вперед"
    #   puts "Выберите 2, если хотите переместиться по маршруту назад"
    #   puts "Выберите 0, если хотите вернуться назад в меню"
    #   name = get_command.to_i
    #   length = @trains.size.to_i
    #   case name
    #   when "1"
    #     if leng <= length
    #     #tr.move_forward
    #     puts "Поезд на новой станции. Маршрут #{@rt}"
    #     else 
    #       puts "XERNIA"
    #     end
    #   when "2"

    #   end

    when "4" # action_with_the_wagon
      puts "Прицепить вагон нажмите - \"1\", оцепить нажмите - \"2\""
      menu = get_command
      
      case menu
      when "1"      
        if @trains.empty?
          puts "Сначала необходимо создать поезд!\n\n"
        else
          puts "К какому поезду хотите прицепить вагон?" #todo не добавлять добавленные вагоны
          enumeration(@trains)
          name = get_command.to_i
          tr = trains[name - 1]
          if tr.type == "pass" && !@pass_wagons.empty?
            puts "Выберите вагон, который необходимо прицепить:"
            enumeration(@pass_wagons)
            name = get_command.to_i
            wg = @pass_wagons[name - 1]
            @pass_wagons.delete(wg)
            tr.add_pass_wagon(wg)
            puts "К поезду #{tr.inspect} прицеплен пассажирский вагон.\n\n" 
          else
            puts "Необходимо создать пассажирский вагон!\n\n"
            if tr.type == "cargo" && !@cargo_wagons.empty?
              puts "Выберите вагон, который необходимо прицепить:"
              enumeration(@cargo_wagons)
              name = get_command.to_i
              wg = @cargo_wagons[name - 1]
              @cargo_wagons.delete(wg)
              tr.add_cargo_wagon(wg)
              puts "К поезду #{tr.inspect} прицеплен грузовой вагон.\n\n"
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
          puts "У поезда #{tr.inspect} нет прицепленных вагонов.\n\n"
        else   
          tr.del_wagon
          puts "У поезда #{tr.inspect} удален вагон.\n\n" 
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
      puts
    when "5" # action_menu
      initial_menu
    end

  end

private

  def enumeration(name)
    name.each_index do |index|
    print "№ #{index + 1}."
    st = name[index]
    puts "#{st.inspect}"
    end
  end  

end

menu = Menu.new
menu.start

while menu.last_command != '0' || menu.last_command == '5'
  menu.initial_menu
end
puts 'bye'