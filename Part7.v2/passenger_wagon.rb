class PassengerWagon < Wagon

  def initialize
    super
    @type = "pass"
    validate!
  end
end