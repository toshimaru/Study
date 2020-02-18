module MyModule
  def my_method
    puts 'hello'
  end
end

class MyClass
  class << self
    include MyModule
  end
end

MyClass.my_method

# This code doesn't work
=begin
module MyModule
  def self.my_method
    puts 'hello'
  end
end

class MyClass
  include MyModule
end

MyClass.my_method # NoMethodError!
=end
