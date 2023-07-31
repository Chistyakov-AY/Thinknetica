module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_writer :instances

    def instances
      @instances ||= 0
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def validate!
      train_type = %w[pass cargo]
      errors = []
      errors << 'Номер поезда не может быть пустым' if number == ''
      errors << 'Неправильный формат номера поезда' if number !~ NUMBER_FORMAT
      errors << 'Неправильный тип поезда' unless train_type.include?(type)
      raise errors.join(' и ') unless errors.empty?
    end

    private

    NUMBER_FORMAT = /^\w{3}(-|)\w{2}$/i.freeze

    def register_instance
      self.class.instances += 1
    end
  end
end
