class CargoWagon < Wagon

  def initialize(total_place)
    @type = "cargo"
    super
  end

  def take_place(volume)
    if volume <= @total_place
      @used_place += volume
    else
      puts "Проверьте объем!\n\n"
    end
  end
end