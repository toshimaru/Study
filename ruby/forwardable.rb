require 'forwardable'

class A
  def hello
    puts "hello"
  end
  
  def hi(str)
    puts str
  end
end

class B
  extend Forwardable

  def initialize(source)
    @source = source
    self.class.def_delegators :@source, *source.public_methods(false)
  end
end

b = B.new(A.new)
b.hello
b.hi "x"
