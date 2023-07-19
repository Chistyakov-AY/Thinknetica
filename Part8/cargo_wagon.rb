class CargoWagon < Wagon
  def initialize(total_volume)
    @type = "cargo"
    super
    @total_volume = total_volume
    @used_volume = 0
    validate!
  end

  def take_place(volume)
    if @total_volume > 0 && @total_volume >= volume
      @total_volume = @total_volume - volume
      @used_volume = @used_volume + volume
    else
      puts "Проверьте объем!\n\n"
    end
  end
end