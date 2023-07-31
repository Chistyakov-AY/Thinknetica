class PassengerTrain < Train
  def initialize(speed = 0)
    super
    @type = 'pass'
    validate!
  end
end
