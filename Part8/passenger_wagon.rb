class PassengerWagon < Wagon
  def initialize(total_place)
    @type = "pass"
    super
  end
  
  def take_place
    if @used_place < @total_place
      @used_place += 1    
    else
      puts "Проверьте объем!\n\n"
    end  end
end