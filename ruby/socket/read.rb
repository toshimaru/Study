require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  connection.puts connection.read
  connection.close
end

# read one line
# connection.puts connection.gets
#
# $ echo gekko | nc localhost 4481
# Server reads "gekko"
#
# $ tailf /var/log/system.log | nc localhost 4481
# Server can't finish reading
