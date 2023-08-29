class PassengerTrain < Train
  validate :number, :presence
  validate :number, :format, /^\w{3}(-|)\w{2}$/i.freeze

  def initialize(speed = 0)
    super
    @type = 'pass'
    validate!
  end
end
