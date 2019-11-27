command_path = `which brew`
puts "command path is #{command_path}"
system "#{command_path} list"
