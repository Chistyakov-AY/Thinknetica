class PassengerTrain < Train

  def initialize(number, speed = 0, type = "pass")
    @number = number
    @speed = speed
    @type = type
    @wagons = []
  end

  def add_pass_wagon(pwag)
      @wagons << pwag
  end
end