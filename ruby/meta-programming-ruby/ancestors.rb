module MyModule
  def my_method
    puts "my_method"
  end
end

class C
  include MyModule
end

class D < C
end

p D.ancestors
# => [D, C, MyModule, Object, Kernel, BasicObject]
