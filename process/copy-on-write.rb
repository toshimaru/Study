ary = [1,2,3]

fork do
  p ary
end

fork do
  # CoW works!
  ary << 4
  p ary
end
