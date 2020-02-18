# My custom tap & then implementation
class Object
  def tap
    yield self
    self
  end

  def then
    yield self
  end
end

# tap
p ['a','b','c'].push("x").tap {|x| p x }.map &:upcase

# then
p ['a','b','c'].push("x").then {|x| x.reverse }.map &:upcase
p ['a','b','c'].push("x").tap {|x| x.reverse }.map &:upcase

# then = yield_self
p ['a','b','c'].push("x").yield_self {|x| x.reverse }.map &:upcase
