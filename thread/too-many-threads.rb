10_000.times do |i|
  Thread.new { sleep }
  puts i
end

# too-many-threads.rb:2:in `initialize': can't create Thread: Resource temporarily unavailable (ThreadError)
