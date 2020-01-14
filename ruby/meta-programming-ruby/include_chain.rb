module SecondLevelModule
  def self.included(base)
    base.extend ClassMethod
  end

  def second_level_instance_method
    'ok'
  end

  module ClassMethod
    def second_level_class_method
      'ok'
    end
  end
end

module FirstLevelModule
  def self.included(base)
    base.extend ClassMethod
  end

  def first_level_instance_method
    'ok'
  end

  module ClassMethod
    def first_level_class_method
      'ok'
    end
  end

  include SecondLevelModule
end

class BaseClass
  include FirstLevelModule
end

puts BaseClass.new.first_level_instance_method
puts BaseClass.new.second_level_instance_method

puts BaseClass.first_level_class_method
puts BaseClass.second_level_class_method # => undefined method `second_level_class_method' for BaseClass:Class
