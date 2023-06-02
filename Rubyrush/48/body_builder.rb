class BodyBuilder

  attr_reader :name, :triceps, :biceps, :deltovidka

  def initialize(name)
    @name = name
    @triceps = 0
    @biceps = 0
    @deltovidka = 0
  end

  def pump(muscle)
    case muscle 
    when "triceps"
      5.times do
        @triceps += 1
      end
    when "biceps"
      10.times do
        @biceps += 1
      end
    when "deltovidka"
      @deltovidka += 5
    end
  end

  def show_muscles
    puts "Болдибидер - #{name}, его данные:\nТрицепс - #{triceps}\nБитсепс - #{biceps}\nДельтовидка - #{deltovidka}\n"
  end
end

def cls
  system "clear"
end