module MyModule
  def my_method
    puts "hello"
  end
end

obj = Object.new
class << obj
  include MyModule
end

obj.my_method
p obj.singleton_methods
