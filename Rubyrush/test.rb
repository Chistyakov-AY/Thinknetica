class What
  attr_writer :name, :num
  @@num = 0
  def initialize(name, num)
    @name = name
    @num = num
    @@num += 1
  end

  def self.what
    @@num
  end
end

w = What.new("Alex", 12)
w1 = What.new("Alex", 12)
w1 = What.new("Alex", 12)
p What.what