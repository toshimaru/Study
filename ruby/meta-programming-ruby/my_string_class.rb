class X < String
  def hello
    p self # => "xxx"
    puts self # => xxx
  end
end

X.new("xxx").hello

class Y < String
  def hello
    p self # => hijacked!
    puts self # => yyy
    p self == "hijacked!" # => false
    p self == "yyy" # => true
  end

  def inspect
    "hijacked!"
  end
end

Y.new("yyy").hello

