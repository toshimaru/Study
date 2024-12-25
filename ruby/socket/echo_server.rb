require 'socket'

PORT = 12345
puts "Echo server is running on localhost:#{PORT}"

# ref. https://docs.ruby-lang.org/ja/latest/method/Socket/s/tcp_server_loop.html
Socket.tcp_server_loop(PORT) do |sock, client_addr|
  while message = sock.gets
    puts "Received: #{message.strip}"
    sock.puts "Echo: #{message}"
  end
rescue StandardError => e
  puts "Error: #{e.message}"
ensure
  puts "Client disconnected: #{client_addr.ip_address}:#{client_addr.ip_port}"
  sock.close
end
