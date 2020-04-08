class MyClass
  @my_var = 1
  p "my_var is #{@my_var}"

  def self.read
    @my_var
  end

  def write
    @my_var = 2
  end

  def read
    @my_var
  end
end

obj = MyClass.new
p obj.read
obj.write
p obj.read
p MyClass.read

class Hoge < MyClass
end
p Hoge.read

class Hoge2 < MyClass
  @my_var = 100
end
p Hoge2.read
