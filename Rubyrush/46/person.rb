class Person

  def initialize(first_name, middle_name)  
    @first_name = first_name
    @middle_name = middle_name
  end

  def full_name
  puts "У нас в гостях #{@first_name} #{@middle_name}!"
  end

end