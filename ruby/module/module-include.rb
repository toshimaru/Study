module A
  def a
    puts 1
  end
end

class X
  include A
end

module B
  def b
    puts 2
  end
end

module A
  include B
end

A.include(B) # since Ruby 2.0, `include` is public method

class Y
  include A
end

X.new.a
# X.new.b # => undefined method `b'
Y.new.b
