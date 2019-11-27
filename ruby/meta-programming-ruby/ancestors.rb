module MyModule1
  def my_method
    puts "my_method"
  end
end

module MyModule2
end

class C
  include MyModule1
  include MyModule2
end

class D < C
end

p D.ancestors
# => [D, C, MyModule2, MyModule1, Object, Kernel, BasicObject]
