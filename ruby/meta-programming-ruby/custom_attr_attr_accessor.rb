module CustomAttrAccessor
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor(attr)
      define_method(attr) do
        instance_variable_get "@#{attr}"
      end

      define_method("#{attr}=") do |value|
        instance_variable_set "@#{attr}", value  
      end
    end
  end
end

class A
  include CustomAttrAccessor

  attr_accessor :foo
  attr_accessor :bar
end


a = A.new
p a.foo
a.foo = 100
p a.foo

p a.bar
a.bar = "my value"
p a.bar
