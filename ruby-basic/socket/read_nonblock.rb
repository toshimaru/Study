require "socket"

Socket.tcp_server_loop(4481) do |connection|
  loop do
    begin
      # read nonblock, but it doen't handle multiple connection well
      puts connection.read_nonblock(4096)
    rescue Errno::EAGAIN
      puts "rescue Errno::EAGAIN"
      IO.select([connection])
      puts "IO selected"
      # sleep 5
      retry
    rescue EOFError
      puts "EOFError"
      break
    end
  end

  connection.close
end

# See connection status with below command
# $ netstat -an | grep 4481
