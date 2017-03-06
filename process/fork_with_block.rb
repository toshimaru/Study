puts "Parent process #{Process.pid}"

fork do
  puts "Child process #{Process.pid}"
end

puts "Parent process, again #{Process.pid}"
