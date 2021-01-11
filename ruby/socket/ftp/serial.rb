require 'socket'
require_relative '../command_handler'

module FTP
  CRLF = "\r\n"

  class Serial
    def initialize(port = 21)
      @control_socket = TCPServer.new(port)
      trap(:INT) { exit }
    end

    def gets
      @client.gets(CRLF)
    end

    def respond(message)
      @client.write(message)
      @client.write(CRLF)
    end

    def run
      loop do
        puts "before accept"
        @client = @control_socket.accept
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
    end
  end
end

server = FTP::Serial.new(4481)
server.run
