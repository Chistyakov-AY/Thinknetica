class Person
  attr_reader :first_name, :middle_name

  def initialize(age, first_name, middle_name)  
    @age = age
    @first_name = first_name
    @middle_name = middle_name
  end

  def full_name
    if @age > 60
      puts "У нас в гостях, уважаемый #{@first_name} #{@middle_name}!"
    else 
      puts "Привет #{@first_name}!"
    end
  end

  def old?
    if @age > 60
      true
    else
      false
    end
  end

  def v2_old?
    @age >= 60
  end

end