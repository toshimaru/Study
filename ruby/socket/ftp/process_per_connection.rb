require 'socket'
require_relative '../command_handler'

module FTP
  class ProcessPerConnection
    CRLF = "\r\n"

    def initialize(port = 21)
      @control_socket = TCPServer.new(port)
      trap(:INT) { exit }
    end

    def gets
      res = @client.gets(CRLF)
      res
    end

    def respond(message) 
      @client.write(message)
      @client.write(CRLF)
    end

    def run
      loop do
        @client = @control_socket.accept

        # Create process for each connection
        pid = fork do
          respond "220 OHAI"
          handler = CommandHandler.new(self)
          loop do
            request = gets

            if request
              respond handler.handle(request)
            else
              @client.close
              break
            end
          end
        end

        Process.detach(pid)
      end
    end
  end
end

server = FTP::ProcessPerConnection.new(4481)
server.run
