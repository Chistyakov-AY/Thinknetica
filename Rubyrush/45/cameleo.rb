class Cameleo

attr_reader :color_name

def initialize(color_name)
  @color_name = color_name
end

def change_color
  num = rand(4).to_s
  if num == "0"
    @color_name = "синий"
  elsif num == "1"
    @color_name = "зеленый"
  elsif num == "2"
    @color_name = "желтый"
  end      
end

end