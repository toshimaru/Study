# true or false?
p Thread.main == Thread.current

# true or false?
p Thread.new { Thread.current == Thread.main }.value

# result will be output?
thread = Thread.new do
  # do something
  100.times do |n|
    puts n
  end
end
