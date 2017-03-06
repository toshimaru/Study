ary = [1,2,3]

fork do
  p ary
end

fork do
  ary << 4
  p ary
end
