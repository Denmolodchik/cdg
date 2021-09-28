require_relative 'responce'
require_relative 'html'
require_relative 'branch1'
require_relative 'branch2'
require_relative 'request'
require 'socket'

PORT = 80
APPLICATIONS = { 'branch1.mybank.ru' => Branch1, 'branch2.mybank.ru' => Branch2 }

class Server
  def initialize(port, applications)
    @server = TCPServer.new port
    @applications = applications
    @responce_codes = { 200 => '200 OK', 400 => '400 Bad Request', 404 => 'Not Found' }
  end

  def run
    loop do
      socket = @server.accept

      request_array = read_http_request(socket)

      request = Request.new(request_array)

      if request.error
        responce_http_server(request.error, socket)
      else
        branch = @applications[request.headers['Host']]
        if branch
          responce_http_server(branch.routing(request.path), socket)
        else
          responce_http_server( { responce_code: 400, body: HTML.html_error('Такого сабдомена не существует') } , socket)
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
    responce = Response.show( @responce_codes[_responce[:responce_code]], _responce[:body] )
    socket.write responce
    socket.write "\r\n"
    socket.write _responce[:body]
    socket.close
  end

end

server = Server.new(PORT, APPLICATIONS)
server.run
