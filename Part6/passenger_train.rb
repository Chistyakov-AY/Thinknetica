class PassengerTrain < Train

  def initialize(number = "", speed = 0)
    super
    @type = "pass"
  end

  def add_pass_wagon(pwag)
    @wagons << pwag
  end
end