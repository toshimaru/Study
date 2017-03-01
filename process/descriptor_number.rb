f = File.open "/etc/passwd"
puts f.fileno

f2 = File.open "/etc/passwd"
puts f2.fileno

f.close

f3 = File.open "/dev/null"
puts f3.fileno
