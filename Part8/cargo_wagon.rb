class CargoWagon < Wagon
  def initialize(total_place)
    @type = "cargo"
    super
  end

  def take_place(volume)
    if free_place >= volume
      @used_place += volume
      @total_place -= volume
    else
      puts "Проверьте объем!\n\n"
    end
  end
end