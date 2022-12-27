# frozen_string_literal: true

module A1
end

module A2
  include A1
end

module A3
  include A2
end

p A3.ancestors #=> [A3, A2, A1]

module M1
end

module M2
  include M1
end

module M3
  prepend M1
  include M2
end

p M3.ancestors #=> [M1, M3, M2]
