fork do
  5.times do
    sleep 1
    puts "I'm an orphan!"
  end
end

puts "Start to wait,"
Process.wait
# if comment out below line, process never ends
abort "Parent process died..."
