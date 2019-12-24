class Class
  def initialize
    # This line is not called!
    puts "Class initialized"
  end

  def foo
    puts "Class#foo"
  end

  def self.bar
    puts "Class.bar"
  end
end

class Hoge
  foo

  def bar
    puts "Hoge#bar"
  end
end

h = Hoge.new
h.bar

p Class.instance_methods
p Class.singleton_methods
p Hoge.methods
