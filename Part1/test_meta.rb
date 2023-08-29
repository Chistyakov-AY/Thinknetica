module MyAttrAccesor
  def attr_accessor_with_history(*names)
    names.each do |name|
      define_method(name) { instance_variable_get("@#{name}") }
      define_method("#{name}=") do |value|
        @history ||= {}
        @history_variable ||= []
        @history_variable << instance_variable_set("@#{name}", value)
        @history[name] = @history_variable
      end
      define_method("#{name}_history") { @history[name] }
    end
  end
 
  def strong_attr_accessor(name, attribute_type)
    define_method(name) { instance_variable_get("@#{name}") }
    define_method("#{name}=") do |value|
    if value.class == attribute_type.class
    instance_variable_set("@#{name}=", value) 
    else
    raise('Exception')
    end
    end
  end

end

class Test
extend MyAttrAccesor

  attr_accessor_with_history :my_attr, :a, :b, :c
  strong_attr_accessor :my_attr, :sym

test = Test.new
p test.my_attr
 test.my_attr = 1
p test.my_attr
 test.my_attr = 2
p test.my_attr
 test.my_attr = 3
p test.my_attr_history

test2 = Test.new()
# p test.my_attr2
#  test.my_attr2 = 1
p test2.my_attr2
 test2.my_attr2 = 3
end



