require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  data = connection.readpartial(1024)
  puts data
  
  # recieve urgent data
  urgent_data = connection.recv(1, Socket::MSG_OOB)
  puts urgent_data
end
