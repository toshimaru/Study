module A
  B = "public constant: B"

  private

  C = "private but public constant: C"

  class << self
    D = "class constant: D"

    def const_test
      puts D
    end
  end

  E = "private_constant: E"
  private_constant :E
end

puts A::B
puts A::C
# puts A::D # => uninitialized constant A::D (NameError)
puts A.singleton_class::D
A.const_test
class << A
  puts D
end

# puts A::E # => private constant A::E referenced (NameError)
