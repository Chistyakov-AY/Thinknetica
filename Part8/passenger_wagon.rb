class PassengerWagon < Wagon
  def initialize(total_place)
    @type = "pass"
    super
  end
  
  def take_place
    if free_place > 0
      @used_place += 1
      @total_place -= 1
    else
      puts "В вагоне нет свободных мест!"
    end
  end
end