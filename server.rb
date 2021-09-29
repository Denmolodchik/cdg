require_relative 'response'
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
  end

  def run
    loop do
      socket = @server.accept

      request_array = read_http_request(socket)

      request = Request.new(request_array)

      if request.error
        response_http_server(request.error, socket)
      else
        branch = @applications[request.headers['Host']]
        if branch
          response_http_server(branch.routing(request.path), socket)
        else
          response_http_server( { response_code: 400, body: HTML.html_error('Такого сабдомена не существует') } , socket)
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

  def response_http_server(output, socket)
    response = Response.new( output[:response_code], output[:body] )
    socket.write response.render
    socket.close
  end

end

server = Server.new(PORT, APPLICATIONS)
server.run
