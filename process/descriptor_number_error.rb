f3 = File.open "/dev/null"
puts f3.fileno
f3.close
puts f3.fileno # IOError!!
