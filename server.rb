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
    @applications = { 'branch1.mybank.ru': '1', 'branch2.mybank.ru': '2' }
  end

  def run
    loop do
      socket = @server.accept

      request_array = read_HTTP_request(socket)

      request = Request.new(request_array)

      if request.errors
        responce_HTTP_server(request.errors, socket)
      else
        if @applications.keys.include?(request.headers['Host'].to_sym)
          branch = eval "Branch#{@applications[request.headers['Host'].to_sym]}.new(request.path)"
          if branch.errors
            responce_HTTP_server(branch.errors, socket)
          else
            controller = eval "Controller#{@applications[request.headers['Host'].to_sym]}.new"
            controller.show(branch.id)
            if controller.errors
              responce_HTTP_server(controller.errors, socket)
            else
              responce_HTTP_server(controller.deposit, socket)
            end
          end
        end
      end
    end
  end

  def read_HTTP_request(socket)
    request = Array.new
    while (line = socket.gets.chomp) && !line.empty? do
      request << line
    end
    request
  end

  def responce_HTTP_server(responce, socket)
    html = create_HTML(responce)
    send_responce(html, responce[:responce_code], socket)
  end

  def send_responce(html, responce_code, socket)
    responce = Response.new.show({responce_code: responce_code, html: html})
    socket.write responce
    socket.write "\r\n"  
    socket.write html
    socket.close
  end

  def create_HTML(responce)
    html = HTML.new
    code = responce[:responce_code].split[0].to_i
    if code == 200
      html.html_deposit(responce[:body])
    else
      html.html_string(responce[:body])
    end
  end

end

server = Server.new
server.run
