class Hello
  attr_accessor :color
  def Initialize(name, array)
    @name = name
    #@color = "white"
    @array = array
  end
  def vvod
    name = gets.chomp
    puts "Ввели #{name}"
    puts @color
  end
  # def color=(color)
  #   @color = color
  # end
  # def color
  #   @color
  # end
end
