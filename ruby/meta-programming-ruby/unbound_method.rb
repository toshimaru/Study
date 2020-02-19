module MyModule
  def my_method
    42
  end
end

unbound = MyModule.instance_method :my_method
p unbound.class

# bound method to String.another_method
String.define_method :another_method, unbound
puts "abc".another_method
