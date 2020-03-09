my_var = "flat?"

class MyClass1
  # puts "my_var: #{my_var}" #=> undefined variable!
end

MyClass2 = Class.new do
  puts "my_var: #{my_var}"

  def my_method
    # puts "my_var: #{my_var}" #=> undefined variable!
  end
end

MyClass3 = Class.new do
  define_method :my_method do
    puts "my_var: #{my_var}"
  end
  
  define_singleton_method :my_singleton_method do
    puts "my_var: #{my_var}"
  end
end

MyClass3.new.my_method
MyClass3.my_singleton_method
