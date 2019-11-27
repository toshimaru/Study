module A
  C = "constant"
end

module A
  class B
    p C
  end
end

class A::B
  # p C # => uninitialized constant A::B::C (NameError)
end
