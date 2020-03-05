# define_method v.s. define_singleton_method
define_singleton_method(:method1) { puts "method1"  }

# method1
method1

module ClassMethod
  def method_define
    define_singleton_method(:method6) { puts "method6" }
    define_method(:method7) { puts "method7" }
  end
end

class A
  extend ClassMethod

  def initialize
    define_singleton_method(:method2) { puts "method2"  }
    self.class.define_method(:method3) {  puts "method3" }
  end
  
  define_singleton_method(:method4) { puts "method4"  }
  define_method(:method5) { puts "method5"  }
end

# method2
A.new.method2
# A.method2 # => undefined method

# method3
A.new.method3
# A.method3 # => undefined method

# method4
A.method4

# method5
A.new.method5

# method6 & method7
A.method_define
A.method6
A.new.method7
