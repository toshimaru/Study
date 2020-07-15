@counter = 0

100.times.map do
  Thread.new do
    temp = @counter
    temp = temp + 1
    # Result changes since GIL doesn't work
    # puts temp

    @counter = temp
  end
end.each(&:join)

puts @counter
