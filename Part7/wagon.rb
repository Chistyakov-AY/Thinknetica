class Wagon
  include CompanyName

  attr_reader :type
  
  def initialize
    register_instance
  end

  def name
    @type
  end
end