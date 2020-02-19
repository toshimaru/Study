module A
  B = "private?"

  private

  C = "private?"

  class << self
    D = "private?"

    def const_test
      puts D
    end
  end

  E = "private?"
  private_constant :E
end

puts A::B
puts A::C
# puts A::D # => uninitialized constant A::D (NameError)
# puts A::E # => private constant A::E referenced (NameError)

# retrieve constant D
A.const_test
class << A
  puts D
end
