class Class
  def attr_checked(attr, &block)
    define_method "#{attr}=" do |val|
      raise "invalid attribute" unless block.call(val)
      instance_variable_set "@#{attr}", val
    end

    define_method attr do
      instance_variable_get "@#{attr}"
    end
  end
end

class Person
  attr_checked :age do |v|
    v >= 18
  end
end

person = Person.new
# person.age = 10 # => invalid attribute
person.age = 18
p person.age
