module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, *params)
      @validations ||= []
      @validations << { variable_name: name, validation_type: type, params: params.first }
    end
  end

  module InstanceMethods
    attr_reader :variable

    def validate!
      self.class.validations.each do |valid|
        value = instance_variable_get("@#{valid[:variable_name]}")
        send("#{valid[:validation_type]}", valid[:variable_name], value, valid[:params])
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError => e
      false
    end

    def presence(variable_name, value, *)
      raise RuntimeError, "Название не может быть пустым!" if value.to_s.empty?
    end

    def format(variable_name, value, format)
      raise RuntimeError, "Неправильный формат!" if value !~ format
    end

    def type(variable_name, value, value_type)
      raise RuntimeError, "Неправильный тип!" if value.class != value_type
    end
  end
end