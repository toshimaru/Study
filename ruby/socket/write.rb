require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  connection.write 'Welcome'
  connection.close
end

=begin
$ nc localhost 4481
Welcome%
=end
