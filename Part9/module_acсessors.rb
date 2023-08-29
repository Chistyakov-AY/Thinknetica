module Acсessors
  attr_accessor :history

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
        raise('Некорректный тип')
      end
    end
  end
end
