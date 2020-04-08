Y = "root constants"
module M
  Y = "constants"
  p Y
  p ::Y
end

p M.constants # => [:Y]
