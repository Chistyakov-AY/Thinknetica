class PassengerWagon < Wagon

  def initialize(total_place)
    @type = "pass"
    super
    @total_place = total_place
    @used_place = 0
    validate!
  end
  
  def take_place
    if @total_place > 0
      @total_place -= 1
      @used_place += 1
    else
      puts "В вагоне нет свободных мест!"
    end
  end

  # def create_seats(number_of_seats)
  #   n = 0
  #   @number_of_seats = Array.new(number_of_seats) {n += 1}
  # end
end