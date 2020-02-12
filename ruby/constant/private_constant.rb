module A
  B = "private?"

  private

  C = "private?"

  class << self
    D = "private?"
  end

  E = "private?"
  private_constant :E
end

puts A::B
puts A::C
# puts A::D # => uninitialized constant A::D (NameError)
# puts A::E # => private constant A::E referenced (NameError)
