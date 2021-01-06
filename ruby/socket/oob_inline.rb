require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  connection.setsockopt :SOCKET, :OOBINLINE, true

  puts connection.readpartial(1024) #=> 'foo'
  puts connection.readpartial(1024) #=> '!'
end
