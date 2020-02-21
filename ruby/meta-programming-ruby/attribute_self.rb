class MyClass
  attr_accessor :my_attribute

  def set_attribute(val)
    my_attribute = val
  end
end

obj = MyClass.new
obj.set_attribute(3)
p obj.my_attribute # => nil!!!

class MyClass2
  attr_accessor :my_attribute

  def set_attribute(val)
    self.my_attribute = val
  end
end

obj = MyClass2.new
obj.set_attribute(3)
p obj.my_attribute # => 3
