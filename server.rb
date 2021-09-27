require_relative 'responce'
require_relative 'html'
require_relative 'branch1'
require_relative 'branch2'
require_relative 'request'
require_relative 'controller1'
require_relative 'controller2'
require 'socket'

class Server
  def initialize
    @server = TCPServer.new 80
    @applications = { 'branch1.mybank.ru' => Branch1, 'branch2.mybank.ru' => Branch2 }
    @responce_codes = {200 => '200 OK', 400 => '400 Bad Request', 404 => 'Not Found'}
  end

  def run
    loop do
      socket = @server.accept

      request_array = read_http_request(socket)

      request = Request.new(request_array)

      if request.errors
        responce_http_server(request.errors, socket)
      else
        if @applications.keys.include?(request.headers['Host'])
          branch = @applications[request.headers['Host']].new(request.path)
          if branch.error
            responce_http_server(branch.error, socket)
          else
            responce_http_server(branch.deposit, socket)
          end
        end
      end
    end
  end

  def read_http_request(socket)
    request = Array.new
    while (line = socket.gets.chomp) && !line.empty? do
      request << line
    end
    request
  end

  def responce_http_server(_responce, socket)
    responce = Response.new.show({responce_code: @responce_codes[_responce[:responce_code]], html: _responce[:body]})
    socket.write responce
    socket.write "\r\n"  
    socket.write _responce[:body]
    socket.close
  end

end

server = Server.new
server.run
